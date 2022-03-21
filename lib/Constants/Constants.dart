import 'package:flutter/material.dart';

const kTextFieldInput = TextStyle(color: Colors.black, fontSize: 15);
const kInputDecorationmail = InputDecoration(
  prefixIcon: Icon(
    Icons.mail_outline_rounded,
    color: Colors.grey,
  ),
  labelText: 'Enter your Mail',
  labelStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
const kInputDecorationpassword = InputDecoration(
  prefixIcon: Icon(
    Icons.password_outlined,
    color: Colors.grey,
  ),
  labelText: 'Enter your password',
  labelStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
const kInputDecorationPhoneNumber = InputDecoration(
  labelText: 'Phone Number',
  floatingLabelStyle: TextStyle(color: Colors.grey),
  labelStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
const kInputDecorationPadding =
    EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0);

const backgroundGrey = Color(0xFF252525);
const secondaryBackgroundGrey = Color(0xFF3d3d3d);
const lightBackgroundGrey = Color(0xFFF1F2F7);
const backgroundWhite = Color(0xFFFDFDFD);
