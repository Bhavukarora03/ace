import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googlesignin = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final String email;
  late final String password;
  late final String userName;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void GoogleSignInMethod() async {
    final GoogleSignInAccount? googleSignUser = await _googlesignin.signIn();
    // print(googleSignUser);

    if (googleSignUser != null) {
      Get.offAllNamed('/third');
    } else {}

    GoogleSignInAuthentication? googleSignInAuthentic =
        await googleSignUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentic?.idToken,
        accessToken: googleSignInAuthentic?.accessToken);
    final UserCredential user = await _auth.signInWithCredential(credential);
  }

  void GoogleSignoutMethod() async {
    await _auth.signOut();
  }

  void SignInWithEmailAndPassword() async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
