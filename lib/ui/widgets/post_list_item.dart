import 'package:flutter/material.dart';
import 'package:yana_gaman/styles.dart';
import 'package:getflutter/components/rating/gf_rating.dart';
import 'package:yana_gaman/ui/screens/comments.dart';

class PostLitTile extends StatelessWidget {
  final String title;
  final String description;
  final double rating;
  final String name;
  PostLitTile({this.title, this.description, this.rating, this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10, bottom: 16.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [BoxShadow(color: ShadowColor, blurRadius: 6.0)]),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage('assets/images/myPro.png'),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                name,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          _starRating(),
          Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          Text(
            description,
            maxLines: 4,
            overflow: TextOverflow.fade,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 200.0,
            child: Image.asset(
              'assets/images/img1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CommentScreen())),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.message_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Add Comments",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _starRating() {
    return Container(
      alignment: Alignment.centerLeft,
      // padding: EdgeInsets.only(left: 20.0),
      child: GFRating(
        defaultIcon: Icon(Icons.star, color: Color(0xffd3d4d2), size: 25.0),
        spacing: 6.0,
        filledIcon: Icon(Icons.star, color: GoldColor, size: 25.0),
        value: rating,
        onChanged: (rating) {
          // setState(() {
          //   _rating = rating;
          // });
        },
      ),
    );
  }
}
