import 'package:ace/Screens/Authentication/AuthenticationScreen.dart';

import 'package:ace/Screens/Navigation/bottomNavigation.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var _googlesignin = GoogleSignIn();

  FirebaseAuth auth = FirebaseAuth.instance;
  var codeController = TextEditingController();

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
      Get.offAll((() => LiquidTabBar()));
    }
  }

  GoogleSignInMethod() async {
    googleSignUser.value = await _googlesignin.signIn();

    if (googleSignUser.value == null) {
      Get.to(() => AuthenticationScreen());
    } else {
      Get.to(() => LiquidTabBar());
    }
  }

  GoogleSignoutMethod() async {
    googleSignUser.value = await _googlesignin.signOut();

    if (googleSignUser.value == true) {
      Get.to(() => LiquidTabBar());
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
       final  phoneUser =   await auth.signInWithCredential(credential);

       if(phoneUser != null){
         Get.to(()=> LiquidTabBar());
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
            Get.offAll(() => LiquidTabBar());
          } else {
            Get.snackbar('Couldnot verifyPhoneNumber', 'ok daddy',
                snackPosition: SnackPosition.TOP, colorText: Colors.white);
          }
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }
}
