import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:yana_gaman/ui/screens/home_screen.dart';
import 'package:yana_gaman/ui/screens/login_screen.dart';
import 'package:yana_gaman/ui/screens/profile_screen.dart';

class GuestLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GuestLogin();
  }
}

class _GuestLogin extends State<GuestLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login",
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
                height: 250.0,
                padding: EdgeInsets.only(top: 30.0),
                child: Center(child: Image.asset("assets/images/logo1.png"))),
            //sign in text
            Container(
              width: 500.0,
              height: 50.0,
              child: Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.lightGreen[900],
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),

            UserLogin(),
            FbLogin(),
            GoogleLogin(),
            GuestLoginButton()
          ],
        ),
      ),
    );
  }
}

//user login
class UserLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      width: 320.0,
      height: 40.0,
      child: OutlineButton(
          highlightElevation: 10.0,
          hoverColor: Colors.green[100],
          color: Colors.lightGreen[500],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          child: Text(
            "Login as a User",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          }),
    );
  }
}

//login as a guest
class GuestLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      width: 320.0,
      height: 40.0,
      child: OutlineButton(
          color: Colors.lightGreen[500],
          highlightElevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          child: Text(
            "Login as a Guest",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            //home page login as a guest
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          }),
    );
  }
}

//facebook login
class FbLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FbLogin();
  }
}

class _FbLogin extends State<FbLogin> {
  FacebookLogin facebookLogin = FacebookLogin();
  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        width: 320.0,
        height: 40.0,
        child: OutlineButton(
            highlightElevation: 10.0,
            color: Colors.lightGreen[500],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              logInWithFacebook().whenComplete(() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageIcon(AssetImage('images/FB.png')),
                SizedBox(width: 10.0),
                Text(
                  "Facebook",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )));
  }

  //login with facebook
  Future logInWithFacebook() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin.logIn(['email']);

    final AuthCredential credential = FacebookAuthProvider.getCredential(
        //accessToken: facebookLoginResult.accessToken.token,
        );

    final AuthResult authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn $user");
        onLoginStatusChanged(true);

        break;
    }
  }
}

// login with google acount
class GoogleLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoogleLogin();
  }
}

class _GoogleLogin extends State<GoogleLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        width: 320.0,
        height: 40.0,
        child: OutlineButton(
          highlightElevation: 10.0,
          color: Colors.lightGreen[500],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageIcon(AssetImage('images/google.png')),
              SizedBox(width: 15.0),
              Text(
                " Google",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {
            signInWithGoogle().whenComplete(() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            });
          },
        ));
  }

  //sigin in with google method
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

  //signin with facebook method

  //signout method
  /*void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}*/
}

//facebook signin method
