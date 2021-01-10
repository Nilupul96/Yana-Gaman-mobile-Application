import 'package:flutter/material.dart';
import 'package:yana_gaman/styles.dart';
import 'package:yana_gaman/ui/screens/home_screen.dart';
import 'package:yana_gaman/ui/widgets/button.dart';

class ShowDialog extends StatefulWidget {
  final String btnName;
  final String header;
  final String title;
  final int actionId;

  ShowDialog({this.btnName, this.header, this.title, this.actionId});

  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  @override
  void initState() {
    super.initState();
  }

  referFriendTap() async {
    // _progressDlg.show();
    // Share.share(
    //     'Example Subject  for a message: https://www.dilmaht-lounge.com/');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 328.0,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
            ), 
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                      radius: 36.0,
                      backgroundColor: GoldColor,
                      child: Center(
                          child: Icon(
                        Icons.thumb_up,
                        size: 40.0,
                      ))),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    '${widget.header}',
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${widget.title}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: DefaultFont,
                        color: Color(0XFF87948D),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                      child: Button(
                        buttonName: widget.btnName,
                      ),
                      onTap: () {
                        if (widget.actionId == 1) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                        } else if (widget.actionId == 2) {
                          referFriendTap();
                        } else {
                          Navigator.of(context).pop();
                        }
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
