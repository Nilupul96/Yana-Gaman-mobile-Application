import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yana_gaman/styles.dart';
import 'package:yana_gaman/ui/screens/guestLogin.dart';
import 'package:yana_gaman/ui/screens/home_screen.dart';
import 'package:yana_gaman/ui/screens/signup_screen.dart';
import 'package:yana_gaman/ui/widgets/button.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPage();
  }
}

class LoginPage extends State<Login> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  var _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[700],
          automaticallyImplyLeading: true,
          title: Text("Log In"),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        height: 110.0,
                        padding: EdgeInsets.only(top: 20.0),
                        child: Center(
                            child: Image.asset("assets/images/logo1.png"))),
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
                            suffixIcon: Icon(Icons.visibility_off),
                            labelText: "Password",
                            hintText: 'please enter your Password',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),

                    //forgot password option
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(bottom: 10.0),
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
                    GestureDetector(
                        child: Button(
                          buttonName: "Log in",
                        ),
                        onTap: () => logIn()),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        "OR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        signInWithGoogle().whenComplete(() =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Home())));
                      },
                      child: SizedBox(
                        height: 57.0,
                        child: Container(
                          // margin: EdgeInsets.symmetric(horizontal: 26),
                          alignment: AlignmentDirectional.bottomStart,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/google_logo.png",
                                  width: 20.0,
                                  height: 20.0,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Text('Continue with Google',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      height: 57.0,
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 26),
                        alignment: AlignmentDirectional.bottomStart,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                size: 40.0,
                                color: Colors.lightGreen[500],
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text('Log in as a Guest',
                                  style: TextStyle(
                                      color: Colors.lightGreen[500],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //signup text
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      height: 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New user?',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.grey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SignUp())),
                            child: Text(
                              ' Sign up here ',
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

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }
}
