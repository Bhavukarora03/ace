import 'package:ace/Screens/Authentication/AuthenticationScreen.dart';
import 'package:ace/Screens/OnBoardingScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static const id = "SplashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset("assets/lottie/splash.json"),
      nextScreen: AuthenticationScreen(),
      backgroundColor: Colors.black,
      duration: 1000,
      // curve: Curves.easeInCirc,
    );
  }
}
