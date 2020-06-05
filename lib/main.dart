import 'package:flutter/material.dart';
import 'package:yana_gaman/guestLogin.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GuestLogin(),
    theme: ThemeData(
      primaryColor: Colors.lightGreen[700],
      buttonColor: Colors.lightGreen[700],
    ),
  ));
}
