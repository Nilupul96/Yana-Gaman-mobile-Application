import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yana_gaman/styles.dart';
import 'package:yana_gaman/ui/widgets/button.dart';
import 'package:yana_gaman/ui/widgets/progressDialog.dart';
import 'package:yana_gaman/ui/widgets/progressView.dart';
import 'package:yana_gaman/ui/widgets/textfield.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _bio = TextEditingController();

  // DateTime _dob;
  // DateTime date;
  // var _listGender = ["Male", "Female"];
  // String _valGender;
  File _image;
  // String _valCountryCode;
  // var _countrycode = ["LK", "AU", "US", "IN"];
  String profPic;
  bool isLoad = false;
  final picker = ImagePicker();
  var jsonPosts;
  ProgressDlg _progressDialog;
  static InputBorder enabledBorder =
      OutlineInputBorder(borderSide: BorderSide(color: Color(0xffDFDFDF)));

  Future getImage() async {
    print("object");
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  // getUser() {
  //   return ApiCalls.getUserDetails().then(processAboutList);
  // }

  // void processAboutList(ApiResponse response) async {
  //   if (!mounted) {
  //     return;
  //   }
  //   if (response.isSuccess) {
  //     jsonPosts = await response.jsonBody["data"];
  //     print(jsonPosts);
  //     _firstName.text = jsonPosts["first_name"];
  //     _lastName.text = jsonPosts["last_name"];
  //     _email.text = jsonPosts["email"];
  //     _mobileNumber.text = jsonPosts["mobile"];
  //     _postCode.text = jsonPosts["post_code"];
  //     _street.text = jsonPosts["street"];
  //     _city.text = jsonPosts["city"];
  //     _valCountryCode = jsonPosts["country_code"];
  //     date = DateTime.parse(jsonPosts["dob"]);
  //     _dateOfBirth.text = DateFormat("yyyy-MM-dd").format(date);
  //     _valGender = jsonPosts["gender"];
  //     profPic = jsonPosts["profile_picture"];

  //     setState(() {
  //       isLoad = false;
  //     });
  //   } else {
  //     Alerts.showMessageForResponse(context, response);
  //     print('responce failure');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _firstName.text = "Nilupul";
    _email.text = "nilupulisurujith96@gmail.com";
    _city.text = "Ratnapura";
    _bio.text = "love to be traveller";
    // getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.lightGreen[700],
        title: Text("Edit Profile"),
      ),
      backgroundColor: Colors.white,
      // bottomNavigationBar: BottomNavbar(),

      body: isLoad
          ? Center(child: ProgressView(small: true))
          : ListView(
              children: [
                Container(
                  height: 155.00,
                  child: Stack(
                    children: [
                      Positioned(
                          left: (MediaQuery.of(context).size.width - 115) / 2,
                          top: 26.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(72.5),
                            child: Container(
                              child: _image == null
                                  ? profPic != null
                                      ? Image.network(
                                          profPic,
                                          width: 115,
                                          height: 115,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          "assets/images/myPro.png",
                                          width: 115,
                                          height: 115,
                                          fit: BoxFit.cover,
                                        )
                                  : Image.file(_image,
                                      width: 115,
                                      height: 115,
                                      fit: BoxFit.cover),
                            ),
                          )),
                      Positioned(
                          right: (MediaQuery.of(context).size.width - 39) / 2,
                          //  right: 20.0,
                          top: 112.0,
                          child: GestureDetector(
                            onTap: () => getImage(),
                            child: CircleAvatar(
                              radius: 19.5,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 17.5,
                                backgroundColor: DefaultColor,
                                child: Icon(
                                  Icons.photo_camera,
                                  color: Colors.white,
                                  size: 22.0,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                        ),
                        CustomTextField(
                          labelText: "Username",
                          labelStyle: HintTextStyle_1,
                          controller: _firstName,
                          keyboardType: TextInputType.text,
                        ),
                        CustomTextField(
                          labelText: "Email Address",
                          labelStyle: HintTextStyle_1,
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          readOnly: true,
                        ),
                        CustomTextField(
                          labelText: "Hometown",
                          labelStyle: HintTextStyle_1,
                          controller: _city,
                          keyboardType: TextInputType.multiline,
                        ),
                        CustomTextField(
                          labelText: "Bio",
                          labelStyle: HintTextStyle_1,
                          controller: _bio,
                          // keyboardType: TextInputType.text,
                          minLine: 8,
                          maxLine: 10,
                        ),
                        SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () {},
                          child: Button(
                            buttonName: "Update",
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
    );
  }

  // void _selectDob() async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(1980),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != _dob) {
  //     setState(() {
  //       _dob = picked;
  //       print(picked);
  //       _dateOfBirth.text = DateFormat("yyyy-MM-dd").format(_dob);
  //     });
  //   }
  // }

  // void updateUser(
  //     String firstName,
  //     String lastName,
  //     String postCode,
  //     String street,
  //     String city,
  //     File file,
  //     String gender,
  //     String countryCode,
  //     String dob) async {
  //   _progressDialog = new ProgressDlg(context);
  //   _progressDialog.show();
  //   final responses = await ApiCalls.updateUser(firstName, lastName, postCode,
  //       street, city, file, gender, countryCode, dob);

  //   print(responses.jsonBody);
  //   _progressDialog.hide();
  //   if (responses.isSuccess) {
  //     Settings.setLastName(lastName);
  //     Settings.setEmail(_email.text);
  //     Settings.setMobile(_mobileNumber.text);
  //     _progressDialog.hide();
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
  //   } else {
  //     Alerts.showMessageForResponse(context, responses);
  //   }
  // }
}
