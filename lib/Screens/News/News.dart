import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(child: Text('COMING SOON', style: GoogleFonts.catamaran(fontSize: 20, fontWeight: FontWeight.w900),)),
       Container(height: 300,
          width: 300,
          alignment: Alignment.center,
          child: Lottie.asset('assets/lottie/News.json'),
        )
      ],
    ),
    );
  }
}
