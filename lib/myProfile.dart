import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 40,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen[700],
        title: Text("My Profile"),
      ),
    );
  }
}
