import 'package:flutter/material.dart';

import 'package:yana_gaman/homepage.dart';

import 'package:yana_gaman/styles.dart';
import 'package:yana_gaman/ui/screens/addPost_screen.dart';
import 'package:yana_gaman/ui/screens/diary_screen.dart';
import 'package:yana_gaman/ui/screens/profile_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentindex = 0;
  //page caller in the app
  List<Widget> _children = [HomePage(), AddPost(), Diary(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: DefaultColor,
        unselectedItemColor: Colors.black54,
        currentIndex: _currentindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            title: Text('Post'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Diary'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('My Profile'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
