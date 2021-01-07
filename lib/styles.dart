import 'package:flutter/material.dart';

const DefaultColor = Color(0xff007C85);
const ShadowColor = Color(0xffE4E4E4);
const GrayColor = Color(0xFFf4f3f0);
const GoldColor = Color(0XFFD9B348);

const String DefaultFont = 'CircularStd';

const HeaderStyle = TextStyle(
    fontFamily: DefaultFont,
    color: Color(0XFF3B3B3A),
    fontWeight: FontWeight.w900,
    fontSize: 23.0);
const SubHeaderStyle = TextStyle(
    fontFamily: DefaultFont,
    color: Color(0XFF87948D),
    fontWeight: FontWeight.w500,
    fontSize: 15.0);
const TabMenuStyle = TextStyle(
    color: Color(0XFFC4C4C4),
    fontFamily: DefaultFont,
    fontSize: 13.0,
    fontWeight: FontWeight.w400);
const ButtonTextStyle = TextStyle(
    fontFamily: DefaultFont,
    color: Color(0XFFFFFFFF),
    fontWeight: FontWeight.w800,
    fontSize: 16.0);
const HintTextStyle_1 = TextStyle(
    fontFamily: DefaultFont,
    color: Color(0XFFABABAB),
    fontWeight: FontWeight.w500,
    fontSize: 15.0);
const HintTextStyle_2 = TextStyle(
    fontFamily: DefaultFont,
    color: Color(0XFFABABAB),
    fontWeight: FontWeight.w500,
    fontSize: 12.0);

const HintTextStyle_3 = TextStyle(
    fontFamily: DefaultFont,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 14.0);

const HintTextStyle_4 = TextStyle(
    fontFamily: DefaultFont,
    color: Color(0XFFABABAB),
    fontWeight: FontWeight.w500,
    fontSize: 16.0);

const BodyTextStyle = TextStyle(
    fontFamily: DefaultFont,
    color: Color(0XFF020202),
    fontWeight: FontWeight.w400,
    fontSize: 12.0);

const cardDecoration = BoxDecoration(
  color: GrayColor,
  borderRadius: BorderRadius.all(
    Radius.circular(5.0),
  ),
);

const listTileDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Color(0XFFfcfcfa),
      blurRadius: 3.0,
      spreadRadius: 2.0,
      offset: Offset(
        0.0,
        7.0,
      ),
    )
  ],
  borderRadius: BorderRadius.all(
    Radius.circular(4.0),
  ),
);
const inputTextStyle = TextStyle(fontSize: 16, color: Colors.black);
const hintTextStyle = TextStyle(fontSize: 13, color: Colors.grey);
Border defaultBorder = Border.all(
  color: Color(0xffDFDFDF),
);

const buttonDecoration = BoxDecoration(
  color: DefaultColor,
  boxShadow: [
    BoxShadow(
      color: Color(0XFFfcfcfa),
      blurRadius: 10.0,
      spreadRadius: 9.0,
      offset: Offset(
        0.0,
        7.0,
      ),
    )
  ],
  borderRadius: BorderRadius.all(
    Radius.circular(4.0),
  ),
);
const disableButtonDecoration = BoxDecoration(
  color: Color(0XFF294543),
  boxShadow: [
    BoxShadow(
      color: Color(0XFFfcfcfa),
      blurRadius: 10.0,
      spreadRadius: 9.0,
      offset: Offset(
        0.0,
        7.0,
      ),
    )
  ],
  borderRadius: BorderRadius.all(
    Radius.circular(4.0),
  ),
);

const cancleButtonDecoration = BoxDecoration(
  color: Color(0XFFDB5854),
  boxShadow: [
    BoxShadow(
      color: Color(0XFFfcfcfa),
      blurRadius: 10.0,
      spreadRadius: 9.0,
      offset: Offset(
        0.0,
        7.0,
      ),
    )
  ],
  borderRadius: BorderRadius.all(
    Radius.circular(4.0),
  ),
);
String smapleText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper diam eu elit finibus, in malesuada orci accumsan. Quisque congue magna quis malesuada blandit. Donec erat diam, pellentesque sit amet semper a, ultrices non lorem. Mauris vitae fermentum leo. Suspendisse iaculis tristique dignissim. In porttitor justo at commodo tristique. Nunc ultricies convallis ante eget scelerisque. Nunc dapibus interdum arcu, nec pellentesque tellus egestas vitae.";
