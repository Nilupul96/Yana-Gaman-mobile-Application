import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:yana_gaman/styles.dart';
import 'package:yana_gaman/ui/widgets/post_list_item.dart';
import 'package:yana_gaman/ui/widgets/profilePicture.dart';
import 'package:yana_gaman/ui/screens/search_screen.dart';
import 'package:yana_gaman/ui/screens/addPost_screen.dart';

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
            AssetImage('assets/images/img1.jpg'),
            AssetImage('assets/images/img2.jpg'),
            AssetImage('assets/images/img3.jpg'),
          ],
          indicatorBgPadding: 2.0,
        ));
    return Scaffold(
      //Appbar
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Home"),
          actions: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchScreen())),
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
            ProfilePicture(),
          ],
          backgroundColor: Colors.lightGreen[700]),

      //floating Action Button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        backgroundColor: Colors.lightGreen[800],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPost()));
        },
      ),
      //image slide Show
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
            child: Text(
              "Trending palces in this week",
              style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          imageSliderCaroUsel,
          SizedBox(
            height: 15.0,
          ),
          _postList()
        ],
      ),
    );
  }

  Widget _postList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (buildContext, index) {
          return PostLitTile(
            title: "Bopath Falls",
            description: smapleText,
            rating: 4.0,
            name: "Nilupul",
          );
        });
  }
}
