import 'package:flutter/material.dart';
import 'package:yana_gaman/homepage.dart';
import 'package:yana_gaman/styles.dart';
import 'package:yana_gaman/ui/screens/diary_screen.dart';
import 'package:yana_gaman/ui/screens/home_screen.dart';
import 'package:yana_gaman/ui/screens/login_screen.dart';
import 'package:yana_gaman/ui/screens/postDetails_screen.dart';
import 'package:yana_gaman/ui/screens/profile_screen.dart';
import 'package:yana_gaman/ui/screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // navigatorKey: navigationKey,
        theme: ThemeData(
            textTheme: TextTheme(
                headline1: HeaderStyle,
                headline2: SubHeaderStyle,
                button: ButtonTextStyle,
                subtitle1: BodyTextStyle),
            primarySwatch: Colors.teal,
            appBarTheme: AppBarTheme(brightness: Brightness.light)),
        // routs: <String, WidgetBuilder>{
        //   "/ourMenuScreen": (BuildContext c) => Homepage(curreniIndex: 1),

        // },
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
