import 'package:flutter/material.dart';
import 'package:yana_gaman/guestLogin.dart';
import 'package:yana_gaman/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yana_gaman/home.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPage();
  }
}

class LoginPage extends State<Login> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.lightGreen[700],
          title: Text("Login"),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 300.0,
                      height: 150.0,
                      child: Logo(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                      //username textfield
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) =>
                            value.isEmpty ? 'please enter email' : null,
                        onSaved: (value) => _email = value,
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: 'please enter your username',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),

                    // paasword text field
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) =>
                            value.isEmpty ? 'please enter password' : null,
                        onSaved: (value) => _password = value,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: 'please enter your Password',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),

                    //forgot password option
                    Container(
                      padding: EdgeInsets.only(bottom: 15.0, left: 200.0),
                      child: InkWell(
                          onTap: () {
                            //reset password
                          },
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ),

                    //call to login button
                    Container(
                      decoration: BoxDecoration(),
                      margin: EdgeInsets.only(bottom: 10.0),
                      width: 300.0,
                      height: 50.0,
                      child: RaisedButton(
                          color: Colors.lightGreen[700],
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                          onPressed: () {
                            logIn();
                            //action
                          }),
                    ),

                    //signup text
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      height: 20.0,
                      child: Text(
                        'If you havent an Account ',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.blueAccent,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //signup button
                    Container(
                      width: 180.0,
                      height: 40.0,
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                        child: RaisedButton(
                            color: Colors.lightGreen[800],
                            elevation: 6.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Text(
                              "SIGNUP",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            onPressed: () {
                              //action
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GuestLogin()));
                            }),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  Future<void> logIn() async {
    final formState = _formKey.currentState;
    formState.save();
    if (formState.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print('wrong password');
      }
    }
  }
}
