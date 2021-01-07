import 'package:flutter/material.dart';

import '../../styles.dart';


class DisableButton extends StatelessWidget {
  final String buttonName;
  DisableButton({this.buttonName});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 57.0,
        child: Container(
          alignment: AlignmentDirectional.bottomStart,
          decoration: BoxDecoration(
            color: Color(0XFF294543),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
            child: Text(
              '$buttonName',
              style: TextStyle(
                  fontFamily: DefaultFont,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
