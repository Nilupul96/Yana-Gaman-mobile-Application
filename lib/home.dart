import 'package:flutter/material.dart';
import 'package:yana_gaman/addPost.dart';
import 'package:yana_gaman/diary.dart';
import 'package:yana_gaman/homepage.dart';
import 'package:yana_gaman/myProfile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 class _HomeState extends State<Home>{
  
  int _currentindex =0;
  //page caller in the app
   callPage(int currentindex){
    switch (currentindex) {
      case 0: return HomePage() ;
      case 1: return  AddPost();
      case 2: return  Diary();
      case 3: return MyProfile();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    
      body: callPage(_currentindex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightGreen[800],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        currentIndex: _currentindex,
        items:[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title: Text('Home'),
           
            ),

             BottomNavigationBarItem(
            icon:Icon(Icons.add_box),
            title: Text('Post'),
           
            ),

             BottomNavigationBarItem(
            icon:Icon(Icons.book),
            title: Text('Diary'),
            ),

             BottomNavigationBarItem(
            icon:Icon(Icons.person),
            title: Text('My Profile'),
            ),
        ],
    onTap: (index){
        setState(() {
          _currentindex=index;
          
        });
    },

        ),
    );
  }
  
 }
  
   
  
