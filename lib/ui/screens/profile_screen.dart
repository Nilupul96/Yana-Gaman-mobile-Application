import 'package:flutter/material.dart';
import 'package:yana_gaman/styles.dart';
import 'package:yana_gaman/ui/screens/editProfile_screen.dart';
import 'package:yana_gaman/ui/screens/point_screen.dart';
import 'package:yana_gaman/ui/widgets/confirmationDialog.dart';
import 'package:yana_gaman/ui/widgets/pointCard.dart';
import 'package:yana_gaman/ui/widgets/profilePicture.dart';
import 'package:yana_gaman/ui/widgets/progressView.dart';

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
        backgroundColor: Colors.white,

        // automaticallyImplyLeading: true,
        title: Text("My Profile", style: HeaderStyle),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(height: 112.0, color: DefaultColor),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    height: 282.0,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(color: ShadowColor, blurRadius: 6.0)
                    ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 46.0),
                        Text(_isLoading ? 'Hi' : 'Hi ' + firstName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: DefaultFont,
                                color: Color(0XFF3B3B3A),
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0)),
                        SizedBox(height: 10.0),
                        Container(
                          height: 1.7,
                          color: Color(0XFFEFEFF0),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 13),
                        ),
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
                              : AssetImage("assets/images/prof.png"),
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
                            backgroundColor: DefaultColor,
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
        ],
      ),
    );
  }

  Widget _findOutMoreButton(String routeName) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        height: 40.0,
        width: 200.0,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: ShadowColor, blurRadius: 6.0)],
            borderRadius: BorderRadius.circular(6.0),
            color: DefaultColor),
        child: Center(
          child: Text('Find Out More',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)),
        ),
      ),
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PointScreen(
                // userTypeName: userPointList.tier.name,
                // points: userPointList.points,
                // startPoints: userPointList.tier.pointsStart,
                // endPoints: userPointList.tier.pointsEnd,
                // tierPoints: userPointList.tierPoints,
                )))
      },
    );
  }
}
