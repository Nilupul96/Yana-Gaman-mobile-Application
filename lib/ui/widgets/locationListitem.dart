import 'package:flutter/material.dart';
import '../../styles.dart';


class LocationListTile extends StatelessWidget {
  final String locationName;
  final String lat;
  final String long;
  LocationListTile({this.locationName, this.lat, this.long});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.0),
          boxShadow: [BoxShadow(color: ShadowColor, blurRadius: 6.0)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 17.0),
          Container(
            child: CircleAvatar(
              backgroundColor: DefaultColor,
              maxRadius: 17.5,
              child: Center(
                  child: Image.asset("asset/images/location.png",
                      height: 18.0, width: 18.0)),
            ),
          ),
          SizedBox(width: 15.0),
          Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '$locationName',
                style: TextStyle(
                    fontFamily: DefaultFont,
                    fontSize: 12.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
