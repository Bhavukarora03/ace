import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

class SlimyCard extends StatefulWidget {
  SlimyCard(
      {Key? key,
      required MaterialColor color,
      required int width,
      required int topCardHeight,
      required int bottomCardHeight,
      required int borderRadius,
      required bool slimeEnabled,
      required topCardWidget,
      required bottomCardWidget})
      : super(key: key);

  @override
  State<SlimyCard> createState() => _SlimyCardState();
}

class _SlimyCardState extends State<SlimyCard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SlimyCard(
          color: Colors.red,
          width: 200,
          topCardHeight: 400,
          bottomCardHeight: 200,
          borderRadius: 15,
          topCardWidget: myWidget01(),
          bottomCardWidget: myWidget01(),
          slimeEnabled: true,
        ),
      ],
    );
  }

  myWidget01() {}
}
