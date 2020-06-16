import 'package:flutter/material.dart';
import 'package:yana_gaman/guestLogin.dart';
import 'package:yana_gaman/home.dart';
import 'package:yana_gaman/login.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Login(),
    theme: ThemeData(
      primaryColor: Colors.lightGreen[800],
      buttonColor: Colors.lightGreen[800],
    ),
  ));
}
