import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:slimy_card/slimy_card.dart';

GlobalKey<ScaffoldState> scfldKey = GlobalKey<ScaffoldState>();

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> with TickerProviderStateMixin {

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.orangeAccent,
    Colors.pinkAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black87,
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(25),
              child: SlimyCard(
                color: colors[index],
                width: 350,
                topCardHeight: 400,
                bottomCardHeight: 100,
                borderRadius: 15,
                topCardWidget: myWidget01(),
                bottomCardWidget: myWidget01(),
                slimeEnabled: true,
              ),
            );
          },
        ));
  }

  myWidget01() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/acelogo.png',
          scale: 5,
        )
      ],
    );
  }
}
