import 'package:flutter/cupertino.dart';

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class DynamicLinkItemModel {
  String channel;
  String code;
  String type;

  

  DynamicLinkItemModel({this.channel, this.code, this.type});
}

