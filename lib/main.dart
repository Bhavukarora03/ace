import 'package:ace/Controller/AuthController.dart';
import 'package:ace/Screens/Authentication/AuthenticationScreen.dart';
import 'package:ace/Screens/HomePage/HomePageScreen.dart';
import 'package:ace/Screens/Navigation/bottomNavigation.dart';
import 'package:ace/Screens/OnBoardingScreen.dart';
import 'package:ace/Screens/SplashScreen.dart';
import 'package:ace/helper/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'Services/Storage.dart';


String? finalEmail;
String? name;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();



  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
final datacontroller = Get.put(AuthController());

   final SecureStorage secureStorage = SecureStorage();

   @override
   void initstate() {

     secureStorage.readSecureData('email').then((value) {
       finalEmail =value;
     });
     secureStorage.readSecureData('name').then((value) {
       name = value;
     });


     Get.offAll(finalEmail != null ? NavigationScreen() : Home());

     super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: bindings(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        dividerColor: Colors.grey,
      ),
      initialRoute: '/Home',
      getPages: [
        GetPage(name: '/Home', page: () => Home()),
        GetPage(name: '/authenticationScreen', page: ()=> AuthenticationScreen()),




      ],
    );
  }
}
