import 'dart:convert';

import 'package:ace/Screens/Authentication/AuthenticationScreen.dart';

import 'package:ace/Screens/Navigation/bottomNavigation.dart';
import 'package:ace/Services/Storage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_icons/line_icons.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Modals/Projects_modal.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _googlesignin = GoogleSignIn();
  var googleSignUser = Rx<GoogleSignInAccount?>(null);
  var codeController = TextEditingController();
  final  _razorpay = Razorpay();
  String url = 'https://api.jsonbin.io/b/62434929d96a510f028b9865';
  late Rx<User?> _user;
  Projects? projects_list;
  var isLoadingData = false.obs;
  final SecureStorage secureStorage = SecureStorage();


  @override
  void onInit() {
    super.onInit();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void onReady() {
    _user = Rx(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, loginwitheandp);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _razorpay.clear(); // Removes all listeners
  }




  loginwitheandp(User? user) {
    if (user == null) {
      return Get.to(() => AuthenticationScreen());
    } else {
      Get.offAll((() => NavigationScreen()));
    }
  }


  GoogleSignInMethod() async {
    googleSignUser.value = await _googlesignin.signIn();

    if (googleSignUser.value == null) {
      Get.to(() => AuthenticationScreen());
    } else {
      Get.offAll(() => NavigationScreen());
    }
  }

   GoogleSignoutMethod() async {
    googleSignUser.value = await _googlesignin.signOut();
    secureStorage.writesSecureData('email', googleSignUser.value?.email ??'');
    secureStorage.writesSecureData('name', googleSignUser.value?.displayName ??'');
    if (googleSignUser.value == true) {
      Get.to(() => NavigationScreen());
    } else {
      Get.offAll(() => AuthenticationScreen());
    }
  }

  registerInWithEmailAndPassword(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseException) {
      Get.snackbar('Ugh!', 'Wrong Info',
          snackPosition: SnackPosition.BOTTOM,
          messageText: const Text(
            "Enter The Email and Password",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          snackStyle: SnackStyle.FLOATING,
          colorText: Colors.white);
    }
  }

  SignInWithEmailAndPassword(String email, password) async {
    try {

      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseException) {
      Get.snackbar('Wrong Login Info Buddy', 'Wrong Info',
          snackPosition: SnackPosition.BOTTOM,
          messageText: const Text(
            "Enter The Email and Password",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          snackStyle: SnackStyle.FLOATING,
          colorText: Colors.white);
    }
  }

  registerUserWithPhone(String phone) async {
    auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          final phoneUser = await auth.signInWithCredential(credential);

          if (phoneUser != null) {
            Get.to(() => NavigationScreen());
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          Get.snackbar('Verification Failed', 'for some reason',
              colorText: Colors.white,
              snackPosition: SnackPosition.TOP,
              messageText: Text(
                exception.toString(),
                style: const TextStyle(color: Colors.white),
              ));
        },
        codeSent: (String verificationID, int? code) {
          AuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationID, smsCode: code.toString());
          final user = auth.signInWithCredential(credential);
          if (user != null) {
            Get.offAll(() => NavigationScreen());
          } else {
            Get.snackbar('Couldnot verifyPhoneNumber', 'ok daddy',
                snackPosition: SnackPosition.TOP, colorText: Colors.white);
          }
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

  projectsRequests() async {
    try {
      isLoadingData(true);
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var results = jsonDecode(response.body);
        projects_list = Projects.fromJson(results);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    finally{
      isLoadingData(false);
    }
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {

    Get.snackbar( response.orderId??'', response.paymentId ??' ', messageText:  Text (response.signature ??''));

  }
  void _handlePaymentError(PaymentFailureResponse response) {
Get.snackbar('payment error', response.message??'');
  }
  void _handleExternalWallet(ExternalWalletResponse response) {

    Get.snackbar('External Wallet is Selection', response.walletName ??'');
    // Do something when an external wallet is selected
  }

  void dispatchPayment(int amount,  String email, int phone, String Description){
    var options = {
      'key': 'rzp_test_xPs5JyuBS4yLAq',
      'amount': amount,
      'name': 'ACE',
      //'order_id': 'order_EMBFqjDHEEn80l',
      'description': Description,
      //'timeout': 120, // in seconds
      'prefill': {'contact': phone, 'email': email}
    };

    try{
      _razorpay.open(options);
    }
    catch(e){}
  }

  Future<bool> saveLoggedInData(bool isUserLoggedin)async{
     SharedPreferences prefs =  await SharedPreferences.getInstance();
     return await prefs.setBool('google', isUserLoggedin );

  }

  Future<bool?> getLoggedInData(bool isUserLoggedin)async{
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    return await prefs.getBool('google');

  }




}
