import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageSliderCaroUsel = Container(
        height: 300,
        child: Carousel(
          images: [
            AssetImage('images/img1.jpg'),
            AssetImage('images/img2.jpg'),
            AssetImage('images/img3.jpg'),
          ],
          indicatorBgPadding: 2.0,
        ));
    return Scaffold(
      //Appbar
      appBar: AppBar(
          titleSpacing: 40,
          automaticallyImplyLeading: false,
          title: Text("Home"),
          backgroundColor: Colors.lightGreen[700]),

      //floating Action Button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        backgroundColor: Colors.lightGreen[800],
        onPressed: () {
          // Navigator.push(
          // Alerts.showMessage(context, "message");
          //     context, MaterialPageRoute(builder: (context) => AddPost()));
        },
      ),
      //image slide Show
      body: ListView(
        children: <Widget>[
          imageSliderCaroUsel,
        ],
      ),
    );
  }
}
