import 'package:google_fonts/google_fonts.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [

           Container(child: Text('COMING SOON', style: GoogleFonts.catamaran(fontSize: 20, fontWeight: FontWeight.w900),)),
           Container(


             child: Lottie.asset("assets/lottie/profile.json"),
           ),

         ],
      )

     

    );
  }
}

