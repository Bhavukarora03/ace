import 'package:ace/Screens/Authentication/AuthenticationScreen.dart';

import 'package:ace/Screens/Navigation/bottomNavigation.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:pinput/pinput.dart';


class AuthController extends GetxController {
  var _googlesignin = GoogleSignIn();

  FirebaseAuth auth = FirebaseAuth.instance;
  var  codeController = TextEditingController();

  late Rx<User?> _user;

  var googleSignUser = Rx<GoogleSignInAccount?>(null);

  @override
  void onInit() {
    super.onInit();
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
      Get.to(() => NavigationScreen());
    }
  }

  GoogleSignoutMethod() async {
    googleSignUser.value = await _googlesignin.signOut();

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
          messageText: Text(
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
          messageText: Text(
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
        timeout: Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
           await auth.signInWithCredential(credential);


        },
        verificationFailed: (FirebaseAuthException exception) {
          Get.snackbar('Verification Failed', 'for some reason',snackPosition: SnackPosition.BOTTOM, messageText: Text(exception.toString()));
        },
        codeSent: (String verificationID, int? code)  {
             AuthCredential credential = PhoneAuthProvider.credential(
                 verificationId: verificationID, smsCode: code.toString());
             final user = auth.signInWithCredential(credential);
             if (user != null) {
               Get.offAll(() => NavigationScreen());
               Get.snackbar('Logged in', 'With phone', snackPosition: SnackPosition.BOTTOM);
             } else {
               Get.snackbar('Couldnot verifyPhoneNumber', 'ok daddy');
             }

        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }
}
