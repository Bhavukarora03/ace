import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Expanded(


             child: Lottie.asset('assets/lottie/ace.json'),
           )
         ],
      )

     

    );
  }
}

