import 'package:flutter/material.dart';
import 'package:yana_gaman/styles.dart';
import 'package:yana_gaman/ui/widgets/pointCard.dart';
import 'package:yana_gaman/ui/widgets/profilePicture.dart';

class PointScreen extends StatefulWidget {
  PointScreen(
      {this.name,
      this.description,
      this.userTypeName,
      this.points,
      this.endPoints,
      this.startPoints,
      this.tierPoints});
  final String name;
  //final String name2;
  final String userTypeName;
  final String description;
  final double points;
  final int tierPoints;
  final int startPoints;
  final int endPoints;

  @override
  _PointScreenState createState() => _PointScreenState(
      userTypeName: userTypeName,
      points: points,
      name: name,
      endPoints: endPoints,
      startPoints: startPoints,
      tierPoints: tierPoints);
}

class _PointScreenState extends State<PointScreen> {
  _PointScreenState(
      {this.userTypeName,
      this.points,
      this.name,
      this.endPoints,
      this.startPoints,
      this.tierPoints});

  double points;
  String userTypeName;
  String name;
  int startPoints;
  int endPoints;
  int tierPoints;

  bool isLoad = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: BottomNavbar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1.0,
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 21.0),
            child: Image.asset(
              "asset/images/backPage2.png",
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [ProfilePicture()],
      ),
      body: ListView(
        children: [
          _pointDisplay(),
          SizedBox(height: 17.0),
          // ListView.builder(
          //     itemCount: _pointList.length,
          //     shrinkWrap: true,
          //     physics: ClampingScrollPhysics(),
          //     itemBuilder: (BuildContext context, int index) {
          //       return _informationTile(_pointList[index].name,
          //           _pointList[index].description, _pointList[index].url);
          //     }),
        ],
      ),
    );
  }

  Widget _pointDisplay() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 6.0, color: ShadowColor)]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            child: Text("Points", style: Theme.of(context).textTheme.headline1),
          ),
          SizedBox(height: 16.0),
          PointCard(
              endPoints: endPoints,
              startPoints: startPoints,
              points: points,
              userTypeName: userTypeName),
          SizedBox(height: 23.0),
        ],
      ),
    );
  }

  Widget _informationTile(name, description, url) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Color(0XFFF4F3F0)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
            child: Row(
              children: [
                Container(
                    width: 15.0,
                    height: 15.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.5),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(
                  width: 6.0,
                ),
                Text(
                  "$name",
                  style: TextStyle(
                      fontFamily: DefaultFont,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 19.0, bottom: 15.0),
            child: Text(
              '$description',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: DefaultFont,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF303030).withOpacity(0.66)),
            ),
          ),
        ],
      ),
    );
  }
}
