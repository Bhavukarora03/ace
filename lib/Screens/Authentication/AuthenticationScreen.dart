import 'package:ace/Controller/AuthController.dart';
import 'package:ace/Screens/Authentication/SignUp.dart';
import 'package:ace/Screens/Authentication/otpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_button/sign_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ace/Constants/Constants.dart';

import '../Navigation/bottomNavigation.dart';

class AuthenticationScreen extends GetWidget<AuthController> {
  TextEditingController textEditingController = TextEditingController();

  AuthController sharedController = Get.put(AuthController());
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var _codeController = TextEditingController();
  late String email;
  late String password;
  late String phoneNumber;

  final userData = GetStorage();










  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          elevation: 5,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
          ),
          actions: [
            Image.asset(
              'assets/images/acelogo.png',
              color: Colors.white,
              scale: 8,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Log in to Continue",
                      style: GoogleFonts.catamaran(
                          fontSize: 32, fontWeight: FontWeight.w900),
                    ),
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
                      textInputAction: TextInputAction.next,
                      controller: passwordcontroller,
                      obscureText: true,
                      style: kTextFieldInput,
                      decoration: kInputDecorationpassword,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => SignUpage());
                      },
                      child: RichText(
                          text: TextSpan(
                              text: "Don't have an account? ",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                              children: [
                            TextSpan(
                                text: "Sign-up",
                                style: TextStyle(
                                    decoration: TextDecoration.underline))
                          ])),
                    ),
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
                    padding: kInputDecorationPadding,
                    child: IntlPhoneField(
                      dropdownTextStyle: const TextStyle(color: Colors.black),
                      dropdownIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      style: const TextStyle(color: Colors.black),
                      decoration: kInputDecorationPhoneNumber,
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        phoneNumber = phone.completeNumber;
                      },
                      flagsButtonPadding: const EdgeInsets.all(10.0),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 240.0),
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "Reset Password",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  GFButton(
                    size: GFSize.LARGE,
                    icon: const Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.SignInWithEmailAndPassword(
                          emailcontroller.text.trim(),
                          passwordcontroller.text.trim());
                    },
                    text: 'Submit',
                    shape: GFButtonShape.pills,
                    elevation: 5,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 80),
                    color: const Color(0xff3B3561),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SignInButton(
                    buttonType: ButtonType.githubDark,
                    onPressed: () {
                      controller.projectsRequests();
                    },
                    padding: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SignInButton(
                      padding: 10,
                      buttonType: ButtonType.googleDark,
                      onPressed: () {
                        // final SharedPreferences prefs = await SharedPreferences.getInstance();
                        // prefs.setString('google', );

                       controller.GoogleSignInMethod();


                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  GFButton(
                    onPressed: () {
                      if (phoneNumber == null) {

                      } else {
                        controller.registerUserWithPhone(phoneNumber);

                        Get.bottomSheet(
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("VERIFICATION",
                                  style: GoogleFonts.catamaran(
                                      fontSize: 30,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1)),
                              Text("Enter the code to your number",
                                  style: GoogleFonts.catamaran(
                                      fontSize: 15,
                                      color: Colors.white,
                                      letterSpacing: 1)),
                              Pinput(
                                defaultPinTheme: defaultPinTheme,
                                focusedPinTheme: focusedPinTheme,
                                submittedPinTheme: submittedPinTheme,
                                length: 6,
                                showCursor: true,
                              ),
                              RichText(
                                  text: const TextSpan(
                                      text: "Didn't receive code? ",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                      children: [
                                    TextSpan(
                                        text: "Resend",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.w900))
                                  ]))
                            ],
                          ),
                          backgroundColor: Colors.black,
                          elevation: 1,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80),
                            ),
                          ),
                        );
                      }
                    },
                    size: GFSize.LARGE,
                    icon: const Icon(
                      Icons.phone_iphone_rounded,
                      color: Colors.white,
                    ),
                    text: 'Proceed with Mobile',
                    shape: GFButtonShape.pills,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                    color: Color(0xff001d3d),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
