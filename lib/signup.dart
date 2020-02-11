import 'package:flutter/material.dart';
import 'package:yana_gaman/login.dart';

class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SignUpPage();
  }
}
class SignUpPage extends State< SignUp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(backgroundColor: Colors.lightGreen,
        title: Text("SignUp"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app),
          onPressed: null,
          )
        ],
        ),
     
       body: Container(
        color: Colors.lightGreenAccent[200],
        //child:SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height:50.0,
            ),
           
            Padding(
              padding: EdgeInsets.symmetric(vertical:16.0, horizontal:16.0),
              child: TextField(
               decoration: InputDecoration(
                 prefixIcon: Icon(Icons.email) ,
                 labelText: 'Email',
                 hintText: 'Please enter valid Email adrees',
                  enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  border: OutlineInputBorder()
               ), 
              )
            ),

            // password
            Padding(
              padding: EdgeInsets.symmetric(vertical:16.0, horizontal:16.0),
              child: TextField(
               decoration: InputDecoration(
                 prefixIcon: Icon(Icons.lock) ,
                 labelText: 'Password',
                  enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  border: OutlineInputBorder()
               ), 
              )
            ),
            //Confirm Password
           
            Padding(
              padding: EdgeInsets.symmetric(vertical:16.0, horizontal:16.0),
              child: TextField(
               decoration: InputDecoration(
                 prefixIcon: Icon(Icons.lock) ,
                 labelText: 'Confirm Password',
                  enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  border: OutlineInputBorder()
               ), 
              )
            ),
            //signup button
             Container(
                width: 200.0,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.lightGreen[700],
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: Text("SIGNUP",
                  style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900
                  ),
            ),
                    onPressed: () {
                      //action
            
            }),
      ),
          ],
        ),
        //)
        
        
      ),  
      );
  }

}