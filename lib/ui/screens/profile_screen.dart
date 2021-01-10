import 'package:flutter/material.dart';
import 'package:yana_gaman/styles.dart';
import 'package:yana_gaman/ui/screens/editProfile_screen.dart';
import 'package:yana_gaman/ui/screens/point_screen.dart';
import 'package:yana_gaman/ui/widgets/button.dart';
import 'package:yana_gaman/ui/widgets/confirmationDialog.dart';
import 'package:yana_gaman/ui/widgets/pointCard.dart';
import 'package:yana_gaman/ui/widgets/post_list_item.dart';
import 'package:yana_gaman/ui/widgets/profilePicture.dart';
import 'package:yana_gaman/ui/widgets/progressView.dart';
import 'package:yana_gaman/utils/alerts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName = "Nilupul";
  String lastName = "Isurujith";
  int points = 30;
  String userTypeName;
  bool _isLoading = false;
  String profilePic;

  // getUser() {
  //   return ApiCalls.getUserDetails().then(processAboutList);
  // }

  // void processAboutList(ApiResponse response) async {
  //   if (!mounted) {
  //     return;
  //   }
  //   if (response.isSuccess) {
  //     var jsonPosts = await response.jsonBody["data"];
  //     print(jsonPosts);
  //     firstName = jsonPosts["first_name"];
  //     profilePic = jsonPosts["profile_picture"];
  //     Settings.setProfilePic(profilePic);
  //     Settings.setFirstName(firstName);
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   } else {
  //     print('responce failure');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[700],
        title: Text("My Profile"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
                child: Icon(Icons.exit_to_app, color: Colors.white, size: 30)),
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(height: 112.0, color: Colors.lightGreen[300]),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    padding: EdgeInsets.all(20.0),
                    // height: 282.0,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(color: ShadowColor, blurRadius: 6.0)
                    ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 40.0,
                        ),
                        Text('Username :Nilupul',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: DefaultFont,
                                color: Color(0XFF3B3B3A),
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0)),
                        SizedBox(height: 10.0),
                        Text('Email :nilupulisurujith96@gmail.com',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: DefaultFont,
                                color: Color(0XFF3B3B3A),
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0)),
                        SizedBox(height: 10.0),
                        Text('Hometown :Ratnapura',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: DefaultFont,
                                color: Color(0XFF3B3B3A),
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0)),
                        SizedBox(height: 10.0),
                        Text('Bio :love to be traveller',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: DefaultFont,
                                color: Color(0XFF3B3B3A),
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0)),
                        SizedBox(height: 20.0),
                        _findOutMoreButton("routeName"),
                      ],
                    ),
                  ),
                ],
              ),
              profilePic != null
                  ? Positioned(
                      left: (MediaQuery.of(context).size.width - 115) / 2,
                      top: 30.0,
                      child: Container(
                        width: 115.0,
                        height: 115.0,
                        // child: _image == null ? SizedBox() : Image.file(_image),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(profilePic),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2.0,
                                  color: profilePic != null
                                      ? ShadowColor
                                      : Colors.transparent)
                            ],
                            borderRadius: BorderRadius.circular(75.0)),
                        alignment: Alignment.center,
                      ),
                    )
                  : SizedBox(),
              Positioned(
                left: (MediaQuery.of(context).size.width - 115) / 2,
                top: 30.0,
                child: Container(
                  width: 115.0,
                  height: 115.0,
                  // child: _image == null ? SizedBox() : Image.file(_image),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: profilePic != null
                              ? NetworkImage(profilePic)
                              : AssetImage("assets/images/myPro.png"),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7.0,
                            color: Colors.black.withOpacity(0.2))
                      ],
                      borderRadius: BorderRadius.circular(75.0)),
                  alignment: Alignment.center,
                ),
              ),
              Positioned(
                  right: (MediaQuery.of(context).size.width - 90) / 2,
                  // right: 20.0,
                  top: 118.0,
                  child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        color: Colors.transparent,
                        child: CircleAvatar(
                          radius: 12.0,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 10.0,
                            backgroundColor: Colors.lightGreen[700],
                            child: Icon(
                              Icons.mode_edit,
                              color: Colors.white,
                              size: 13.0,
                            ),
                          ),
                        ),
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditProfileScreen(),
                          )))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('My post list',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: DefaultFont,
                    color: Color(0XFF3B3B3A),
                    fontWeight: FontWeight.w800,
                    fontSize: 17.0)),
          ),
          SizedBox(height: 10.0),
          _myPostLsit()
        ],
      ),
    );
  }

  Widget _myPostLsit() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (buildContext, index) {
          return Stack(
            children: [
              PostLitTile(
                title: "Bopath Falls",
                description: smapleText,
                rating: 4.0,
                name: "Nilupul",
              ),
              Positioned(
                  right: 10.0,
                  top: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      print("object");
                      Alerts.showConfirmation(
                          context,
                          "Do you want to remove post",
                          "Are you sure?",
                          "Yes",
                          "No",
                          onPositiveCallback,
                          onNegativeCallback);
                    },
                    child: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )),
            ],
          );
        });
  }

  onPositiveCallback() {}
  onNegativeCallback() {}

  Widget _findOutMoreButton(String routeName) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        height: 40.0,
        width: 200.0,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: ShadowColor, blurRadius: 6.0)],
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.lightGreen[700]),
        child: Center(
          child: Text('Edit Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)),
        ),
      ),
      onTap: () => {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EditProfileScreen()))
      },
    );
  }
}
