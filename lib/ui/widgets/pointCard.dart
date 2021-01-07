import 'package:flutter/material.dart';
import 'package:yana_gaman/styles.dart';

class PointCard extends StatefulWidget {
  static String userType;
  final String userTypeName;
  final int startPoints;
  final int endPoints;
  final double points;
  PointCard({this.userTypeName, this.endPoints, this.startPoints, this.points});
  static double lowerValue;
  static double upperValue;
  static double currentValue = 50.0;

  @override
  _PointCardState createState() => _PointCardState();
}

class _PointCardState extends State<PointCard> {
  @override
  void initState() {
    super.initState();
    _pointNumbersSetter();
  }

  void _pointNumbersSetter() {
    if (widget.startPoints <= 7500) {
      PointCard.lowerValue = 0.0;
      PointCard.upperValue = 30000.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      (widget.points.toInt()).toString(),
                      style: TextStyle(
                          fontFamily: DefaultFont,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Color(0XFF3B3B3A)),
                    ),
                    Container(
                      width: 100.0,
                      padding: EdgeInsets.only(left: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.star,
                              color: Color(0XFFFFAC3E),
                              size: 14.0,
                            ),
                          ),
                          Text("Your Point Balance",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: DefaultFont,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0XFF494949).withOpacity(0.66)))
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 20.0,
                  width: 75.0,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color(0XFFFFF1DC)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 5.8,
                        backgroundColor: Color(0XFFFFAC3E),
                      ),
                      SizedBox(width: 3.0),
                      Text(widget.userTypeName,
                          style: TextStyle(
                              fontFamily: DefaultFont,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w300,
                              color: Color(0XFFFFC107)))
                    ],
                  ),
                )
              ],
            ),
          ),
          _pointSlider(context),
        ],
      ),
    );
  }

  Widget _pointSlider(context) {
    return Stack(
      children: [
        Container(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTickMarkColor: GoldColor,
                overlayColor: Colors.transparent,
                trackHeight: 4.0,
                activeTrackColor: GoldColor,
                valueIndicatorColor: Colors.transparent,
                thumbColor: Colors.transparent,
                thumbShape: SliderComponentShape.noOverlay,
                inactiveTrackColor: Color(0XFFE3DFD6)),
            child: Slider(
              min: widget.startPoints.toDouble(),
              max: widget.endPoints.toDouble(),
              value: widget.points.toDouble(),
              onChanged: (val) {},
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 15.0,
          right: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getNumber(0),
              _getNumber(1),
              _getNumber(2),
              _getNumber(3),
              _getNumber(4),
              _getNumber(5),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getNumber(int id) {
    int num = (widget.startPoints +
            (((widget.endPoints - widget.startPoints) / 5) * id))
        .toInt();
    return !(id == 0 || id == 5)
        ? Container(
            child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 8,
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: (widget.startPoints +
                              (id *
                                  (widget.endPoints - widget.startPoints) /
                                  5)) <=
                          widget.points
                      ? GoldColor
                      : Color(0xffE3DFD6),
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(num.toString(),
                  style: TextStyle(
                      fontFamily: DefaultFont,
                      fontSize: 11.0,
                      fontWeight: FontWeight.w300,
                      color: Color(0XFF494949).withOpacity(0.66)))
            ],
          ))
        : SizedBox();
  }
}
