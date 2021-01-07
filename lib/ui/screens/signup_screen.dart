import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yana_gaman/ui/screens/login_screen.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPage();
  }
}

class SignUpPage extends State<SignUp> {
  var _formKey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[700],
          title: Text("SignUp"),
          actions: <Widget>[],
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),

                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            value.isEmpty ? 'please enter Email address' : null,
                            onSaved: (value)=>_email=value,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            hintText: 'Please enter valid Email adrees',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen[700])),
                            border: OutlineInputBorder()),
                      )),

                  // password
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) =>
                            value.isEmpty ? 'please enter password' : null,
                            onSaved: (value)=>_password=value,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen[700])),
                            border: OutlineInputBorder()),
                      )),
                  //Confirm Password

                /*  Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) =>
                            value.isEmpty ? 'please confirm password' : null,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Confirm Password',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightGreen[700])),
                            border: OutlineInputBorder()),
                      )),
                      */
                  //signup button
                  Container(
                    width: 200.0,
                    height: 50.0,
                    child: RaisedButton(
                        color: Colors.lightGreen[700],
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
                          signUp();
                        }),
                  ),
                ],
              ),
              //)
            ),
          ),
        ));
  }

  void signUp() async {
    final formState = _formKey.currentState;
    formState.save();
    if (formState.validate()) {
      try {
        FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email, password: _password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      } catch (e) {
        print('error');
      }
    }
  }
}
