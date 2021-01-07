import 'package:flutter/material.dart';
import 'package:yana_gaman/api/api_response.dart';
import '../styles.dart';
import 'error_messages.dart';

class Alerts {
  static void _close(BuildContext context, {Function onCloseCallback}) {
    Navigator.of(context).pop();
    if (onCloseCallback != null) {
      onCloseCallback();
    }
  }

  static void showMessageForResponse(BuildContext context, ApiResponse response,
      {String title = "We are sorry!",
      String button = "OK",
      Function onCloseCallback}) {
    String message = ErrorMessages.getErrorMessage(response);
    showMessage(context, message,
        title: title, button: button, onCloseCallback: onCloseCallback);
  }

  static void showMessage(BuildContext context, String message,
      {String title = "We are sorry!",
      String button = "OK",
      Function onCloseCallback}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
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
                            backgroundColor: Color(0XFF3b3b3b),
                            child: Icon(
                              Icons.warning,
                              size: 30.0,
                            )),
                        SizedBox(height: 25.0),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // fontFamily: DefaultFont,
                              color: Color(0XFF87948D),
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0),
                        ),
                        SizedBox(height: 40.0),
                        GestureDetector(
                          child: SizedBox(
                            height: 57.0,
                            child: Container(
                              alignment: AlignmentDirectional.bottomStart,
                              decoration: buttonDecoration,
                              child: Center(
                                child: Text(button,
                                    style: Theme.of(context).textTheme.button),
                              ),
                            ),
                          ),
                          onTap: () =>
                              _close(context, onCloseCallback: onCloseCallback),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  static void showConfirmation(
      BuildContext context,
      String message,
      String title,
      String buttonPositive,
      String buttonNegative,
      Function onPositiveCallback,
      Function onNegativeCallback) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
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
                        SizedBox(height: 35.0),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: DefaultFont,
                              color: Color(0XFF87948D),
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0),
                        ),
                        SizedBox(height: 40.0),
                        GestureDetector(
                          child: SizedBox(
                            height: 57.0,
                            child: Container(
                              alignment: AlignmentDirectional.bottomStart,
                              decoration: buttonDecoration,
                              child: Center(
                                child: Text(buttonPositive,
                                    style: Theme.of(context).textTheme.button),
                              ),
                            ),
                          ),
                          onTap: () => _close(context,
                              onCloseCallback: onPositiveCallback),
                        ),
                        SizedBox(height: 13.0),
                        GestureDetector(
                          child: SizedBox(
                            height: 57.0,
                            child: Container(
                              alignment: AlignmentDirectional.bottomStart,
                              decoration: cancleButtonDecoration,
                              child: Center(
                                child: Text(buttonNegative,
                                    style: Theme.of(context).textTheme.button),
                              ),
                            ),
                          ),
                          onTap: () => _close(context,
                              onCloseCallback: onNegativeCallback),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
