import 'package:flutter/material.dart';
import 'package:yana_gaman/login.dart';

class GuestLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title:"login",
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.lightGreenAccent,
        child: Column(
          children: <Widget>[
            Logo(),
            //sign in text
            Container(
              width: 500.0,
              height: 50.0,
              child: Padding(
               padding: EdgeInsets.only(left:40.0),
               child:Text('Sign in',
               style: TextStyle(
                 decoration: TextDecoration.none,
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
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
//upper logo
class Logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage= AssetImage('images/logo1.png');
    Image image = Image(image: assetImage);

    return Container(
      height: 250.0,
      padding: EdgeInsets.only(top: 30.0),
        child: Center(child:image));
  }

}
//user login
class UserLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      width: 320.0,
      height: 40.0,
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
          child: Text("Login as a User",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed:(){
            //user login
          Navigator.push(context, MaterialPageRoute(
              builder: (context) =>Login()
          ));
          }),
    );
  }
}
//login as a guest
class GuestLoginButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      width: 320.0,
      height: 40.0,
      child: OutlineButton(
        highlightElevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          ),
          //elevation: 7.0,
          child: Text("Login as a Guest",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
            ),

          ),
          onPressed:(){
            //action

          }),
    );
  }

}

//facebook login
class FbLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FbLogin();
  }
}
class _FbLogin extends State<FbLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      width: 320.0,
      height: 40.0,
      child:OutlineButton(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ), 
      onPressed: () {
        //action
      },
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           ImageIcon(AssetImage('images/FB.png')),
             SizedBox(
              width:10.0
            ),
              Text("Facebook",
              style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              ),
               ),
          ],
          
        )
        
      )
    );
  }
  
}
// login with google acount
class GoogleLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _GoogleLogin();
  }
}
class _GoogleLogin extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      width: 320.0,
      height: 40.0,
      child:OutlineButton(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            ImageIcon(AssetImage('images/google.png')),
            SizedBox(
              width:15.0
            ),
              Text(" Google",
                  style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          ],
        ), 
        
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ), 
      onPressed: () {
        //action
      },)
    );
  }
  
}


