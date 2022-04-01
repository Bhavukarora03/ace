import 'package:ace/Controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPe extends StatefulWidget {
  const RazorPe({Key? key}) : super(key: key);

  @override
  State<RazorPe> createState() => _RazorPeState();
}

class _RazorPeState extends State<RazorPe> {
  final AuthController razorController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: Row(
        children: [
          IconButton(
            onPressed: () {
              razorController.dispatchPayment(
                  50000, 'bhavuk.arora03@gmail.com', 8708254881, 'Get this hoodie');
            },
            icon: Icon(Icons.payment),
          )
        ],
      ),
    );
  }
}
