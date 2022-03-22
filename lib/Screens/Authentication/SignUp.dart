import 'package:ace/Controller/AuthController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/Constants.dart';

class SignUpage extends StatefulWidget {



  @override
  State<SignUpage> createState() => _SignUpageState();
}

class _SignUpageState extends State<SignUpage> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(

                "Let's Get you \n Signed Up.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.catamaran(
                    fontSize: 32, fontWeight: FontWeight.w900,),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: kInputDecorationPadding,
              child: TextField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  style: kTextFieldInput,
                  decoration: kInputDecorationmail),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: kInputDecorationPadding,
              child: TextField(
                controller: passwordcontroller,
                obscureText: true,
                style: kTextFieldInput,
                decoration: kInputDecorationpassword,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: kInputDecorationPadding,
              child: TextField(


                keyboardType: TextInputType.name,
                style: kTextFieldInput,
                decoration: kInputDecorationusername,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GFButton(
              size: GFSize.LARGE,
              icon: const Icon(
                Icons.mail,
                color: Colors.white,
              ),
              onPressed: () {
           controller.registerInWithEmailAndPassword(emailcontroller.text.trim(), passwordcontroller.text);

              },
              text: 'Submit',
              shape: GFButtonShape.pills,
              elevation: 5,
              padding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 80),
              color: const Color(0xff3B3561),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    indent: 50,
                    endIndent: 30,
                  ),
                ),
                Text(
                  "Or",
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    endIndent: 50,
                    indent: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {

                },
                child: RichText(text: TextSpan(text: "Already a member of ACE ?  ",style: TextStyle(color: Colors.grey, fontSize: 13),
                    children: [TextSpan(text: "LOGIN",style: TextStyle(decoration: TextDecoration.underline, letterSpacing: 2, fontWeight: FontWeight.w900))]
                )

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
