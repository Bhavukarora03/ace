import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShopMerch extends StatefulWidget {
  const ShopMerch({Key? key}) : super(key: key);

  @override
  State<ShopMerch> createState() => _ShopMerchState();
}

class _ShopMerchState extends State<ShopMerch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Expanded(


    child: Lottie.asset('assets/lottie/Shop.json'),
    )
    ],
    )
    );
  }
}
