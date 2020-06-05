import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 40,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen[700],
        title: Text("Add Post"),
      ),
    );
  }
}
