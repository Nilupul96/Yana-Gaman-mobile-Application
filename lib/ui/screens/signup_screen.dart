import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yana_gaman/ui/screens/login_screen.dart';
import 'package:yana_gaman/ui/widgets/button.dart';
import 'package:yana_gaman/ui/widgets/textfield.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPage();
  }
}

class SignUpPage extends State<SignUp> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[700],
          title: Text("Sign Up"),
          actions: <Widget>[],
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    CustomTextField(
                      controller: _username,
                      labelText: "Username",
                    ),
                    CustomTextField(
                      controller: _email,
                      labelText: "Email",
                    ),
                    CustomTextField(
                      controller: _username,
                      labelText: "Password",
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      child: Button(
                        buttonName: "Sign UP",
                      ),
                      onTap: () => signUp(),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      height: 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have a account',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.grey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Login())),
                            child: Text(
                              ' Log In ',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.blue,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
            email: _email.text, password: _password.text);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      } catch (e) {
        print('error');
      }
    }
  }
}
