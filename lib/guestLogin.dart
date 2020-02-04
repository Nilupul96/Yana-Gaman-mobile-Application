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
            UserLogin(),
            GuestLoginButton()

          ],
        ),

      ),
    );
  }
}
class Logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage= AssetImage('images/logo1.png');
    Image image = Image(image: assetImage);

    return Container(
      padding: EdgeInsets.only(top: 30.0),
        child: Center(child:image));
  }

}
//user login
class UserLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0,bottom: 10.0),
      width: 320.0,
      height: 50.0,
      child: OutlineButton(
        highlightedBorderColor: Colors.black,
        splashColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        color: Colors.green,
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
      margin: EdgeInsets.only(top: 10.0,bottom: 20.0),
      width: 320.0,
      height: 50.0,
      child: OutlineButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          ),
          color: Colors.green,
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