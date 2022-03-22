import 'package:ace/Screens/Authentication/AuthenticationScreen.dart';
import 'package:ace/Screens/HomePage/HomePageScreen.dart';

import 'package:ace/Screens/Navigation/bottomNavigation.dart';
import 'package:ace/Screens/OnBoardingScreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var _googlesignin = GoogleSignIn();

  FirebaseAuth auth = FirebaseAuth.instance;

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
    ever(_user, _loginwitheandp);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  _loginwitheandp(User? user) {
    if (user == null)
      return Get.to(()=> AuthenticationScreen());
    else {
      Get.to(() => NavigationScreen());
    }
    ;
  }

  GoogleSignInMethod() async {
    googleSignUser.value = await _googlesignin.signIn();

    if (googleSignUser.value == null) {
      Get.to(() => AuthenticationScreen());
    } else {
      Get.to(() => NavigationScreen());
    }
  }

  Login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {}
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
      Get.snackbar('Ugh!', 'Wrong Info',snackPosition: SnackPosition.BOTTOM, messageText: Text("Enter The Email and Password", style: TextStyle(color: Colors.white),
      ),backgroundColor: Colors.black, snackStyle: SnackStyle.FLOATING, colorText: Colors.white);
    }
  }
  SignInWithEmailAndPassword(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseException) {
      Get.snackbar('Wrong Login Info Buddy', 'Wrong Info',snackPosition: SnackPosition.BOTTOM, messageText: Text("Enter The Email and Password", style: TextStyle(color: Colors.white),
      ),backgroundColor: Colors.black, snackStyle: SnackStyle.FLOATING, colorText: Colors.white);
    }
  }


  registerUserWithPhone(String phone) async{

  }
}
