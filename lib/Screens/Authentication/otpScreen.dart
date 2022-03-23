import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';


class OtpVerfication extends StatefulWidget {
  const OtpVerfication({Key? key}) : super(key: key);


  @override
  State<OtpVerfication> createState() => _OtpVerficationState();
}

class _OtpVerficationState extends State<OtpVerfication> {

  final _codeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,


    );
  }
}
