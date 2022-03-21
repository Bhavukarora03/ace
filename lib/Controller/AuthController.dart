import 'package:ace/Screens/Authentication/AuthenticationScreen.dart';
import 'package:ace/Screens/HomePage/HomePageScreen.dart';
import 'package:ace/Screens/Navigation/bottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var _googlesignin = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var googleSignUser = Rx<GoogleSignInAccount?>(null);


  late final String email;
  late final String password;
  late final String userName;



  @override
  void onInit() {
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

  GoogleSignInMethod() async {
    googleSignUser.value = await _googlesignin.signIn();

    if (googleSignUser.value == null) {
      Get.to(()=> AuthenticationScreen());
    } else {
      Get.to(()=> NavigationScreen());
    }
  }

  GoogleSignoutMethod() async {
    await _auth.signOut();
  }

  void SignInWithEmailAndPassword() async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }



}
