import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressView extends StatefulWidget {
  final _ProgressViewState _progressViewState = _ProgressViewState();
  final bool small;

  ProgressView({this.small = false});

  @override
  State<StatefulWidget> createState() {
    return _progressViewState;
  }
}

class _ProgressViewState extends State<ProgressView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: Container(
        width: widget.small ? 50 : 100,
        height: widget.small ? 50 : 100,
        color: Colors.white,
        child: SizedBox(
          width: widget.small ? 40 : 90,
          height: widget.small ? 40 : 90,

          // child: Image.asset(
          //   "assets/images/logo1.gif",
          //   height: widget.small ? 40 : 90,
          //   width: widget.small ? 40 : 90,
          // ),

          child: SpinKitCircle(
              color: Colors.lightGreen[700], size: widget.small ? 30 : 60),
        ),
      ),
    );
  }
}
