import 'package:flutter/material.dart';
import 'package:yana_gaman/ui/screens/profile_screen.dart';
import 'package:yana_gaman/utils/settings.dart';

class ProfilePicture extends StatefulWidget {
  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  String proPic;
  String _firstName;
  String _lastName;
  bool isLoad = false;

  getProfile() async {
    proPic = await Settings.getProfilePic();
    _firstName = await Settings.getFirstName();
    _lastName = await Settings.getLastName();
    setState(() {
      isLoad = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoad
        ? GestureDetector(
            child: Container(
                margin: EdgeInsets.only(right: 10.0),
                padding: EdgeInsets.only(left: 10, right: 10.0),
                child: CircleAvatar(
                  backgroundImage: proPic == null
                      ? (_firstName != null && _lastName != null)
                          ? AssetImage(
                              'assets/images/myPro.png',
                            )
                          : AssetImage('assets/images/myPro.png')
                      : NetworkImage(proPic),
                  radius: 15.0,
                  backgroundColor: Colors.grey[200],
                  // child: Container(
                  //     child: (proPic == null &&
                  //             _firstName != null &&
                  //             _lastName != null)
                  //         ? Container(
                  //             padding: EdgeInsets.all(11.0),
                  //             child: Center(
                  //                 child: Text(
                  //               _firstName[0].toString() +
                  //                   _lastName[0].toString(),
                  //               style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 12.0,
                  //                   fontWeight: FontWeight.bold),
                  //             )),
                  //           )
                  //         : SizedBox()),
                )),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfileScreen())))
        : SizedBox();
  }
}
