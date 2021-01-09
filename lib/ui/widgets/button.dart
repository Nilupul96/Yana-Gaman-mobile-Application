import 'package:flutter/material.dart';
import 'package:yana_gaman/styles.dart';

class Button extends StatelessWidget {
  final String buttonName;
  Button({this.buttonName});
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 57.0,
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 26),
          alignment: AlignmentDirectional.bottomStart,
          decoration: BoxDecoration(
            color: Colors.lightGreen[700],
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
            child: Text('$buttonName',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0)),
          ),
        ),
      ),
    );
  }
}
