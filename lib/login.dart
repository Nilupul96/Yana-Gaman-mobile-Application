import 'package:flutter/material.dart';
import 'package:yana_gaman/guestLogin.dart';
import 'package:yana_gaman/guestLogin.dart';
import 'package:yana_gaman/signup.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPage();
  }

}

class LoginPage extends State<Login>{
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _fromKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightGreen,
        title: Text("Login"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app),
          onPressed: null,
          )
        ],
        ),
        
      body: Container(
        padding: EdgeInsets.only(left: 20.0,right:20.0),
        color: Colors.lightGreenAccent[200],
        child: Column(
          children: <Widget>[
            Container(
              width: 300.0,
              height: 150.0,
              child:Logo() ,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0,bottom: 10.0),
              child:TextFormField(
              decoration: InputDecoration(
                  labelText: "Username",
                  hintText: 'please enter your username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ) ,
            ),
            // paasword text field
            Padding(padding: EdgeInsets.only(top:10.0,bottom: 10.0),
              child:TextField(
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: 'please enter your Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ) ,
            ),

            //forgot password option
            Container(
              padding: EdgeInsets.only(bottom: 15.0,left: 250.0),
              child: InkWell(
                child: Text("Forgot password?",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                )
              ),
            ),

            //call to login button
            LoginButton(),

            //signup text
            Container(
              margin: EdgeInsets.only(top:20.0),
              height: 20.0,
              child: Text('If you havent an Account ',
              style: TextStyle(
                 decoration: TextDecoration.none,
                 color: Colors.blueAccent,
                 fontSize:18.0,
                 fontWeight: FontWeight.bold
              ),
              ),
             
            ),
            //call to signup button
            SignupButton(),
          ],
        ),
     
      )
    );
  }
}
//login button
class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( bottom: 10.0),
      width: 300.0,
      height: 50.0,
      child: RaisedButton(
          color: Colors.lightGreen[700],
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          ),
          child: Text("LOGIN",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w900
            ),
          ),
          onPressed: () {
            //action
          }),
    );
  }
}

//signup button
class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
      width: 300.0,
      height: 50.0,
      child: Container(

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
              Navigator.push(context, MaterialPageRoute(
              builder: (context) =>SignUp()
          ));
            }),
      ),
    );
  }
}