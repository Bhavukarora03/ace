import 'package:ace/Controller/AuthController.dart';
import 'package:ace/Screens/Authentication/AuthenticationScreen.dart';
import 'package:ace/Screens/HomePage/HomePageScreen.dart';
import 'package:ace/Screens/Navigation/bottomNavigation.dart';
import 'package:ace/Screens/OnBoardingScreen.dart';
import 'package:ace/Screens/Profile/ProfileScreen.dart';
import 'package:ace/Screens/SplashScreen.dart';
import 'package:ace/helper/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: bindings(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        dividerColor: Colors.grey,
      ),
      initialRoute: '/splashscreen',
      getPages: [
        GetPage(name: '/splashscreen' ,page: () =>  SplashScreen()),
        GetPage(name: '/authenticationScreen', page: ()=> AuthenticationScreen()),
        //GetPage(name: '/MainScreen', page: ()=> NavigationScreen())
        GetPage(name: '/Home', page: () => Home()),

      ],
    );
  }
}
