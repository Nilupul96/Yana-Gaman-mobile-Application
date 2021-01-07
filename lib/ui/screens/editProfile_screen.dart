import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:yana_gaman/api/api_calls.dart';
import 'package:yana_gaman/api/api_response.dart';
import 'package:yana_gaman/styles.dart';
import 'package:yana_gaman/ui/screens/profile_screen.dart';
import 'package:yana_gaman/ui/widgets/progressDialog.dart';
import 'package:yana_gaman/ui/widgets/progressView.dart';
import 'package:yana_gaman/ui/widgets/textfield.dart';
import 'package:yana_gaman/utils/alerts.dart';
import 'package:yana_gaman/utils/settings.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _postCode = TextEditingController();
  TextEditingController _street = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _dateOfBirth = TextEditingController();
  DateTime _dob;
  DateTime date;
  var _listGender = ["Male", "Female"];
  String _valGender;
  File _image;
  String _valCountryCode;
  var _countrycode = ["LK", "AU", "US", "IN"];
  String profPic;
  bool isLoad = true;
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

  getUser() {
    return ApiCalls.getUserDetails().then(processAboutList);
  }

  void processAboutList(ApiResponse response) async {
    if (!mounted) {
      return;
    }
    if (response.isSuccess) {
      jsonPosts = await response.jsonBody["data"];
      print(jsonPosts);
      _firstName.text = jsonPosts["first_name"];
      _lastName.text = jsonPosts["last_name"];
      _email.text = jsonPosts["email"];
      _mobileNumber.text = jsonPosts["mobile"];
      _postCode.text = jsonPosts["post_code"];
      _street.text = jsonPosts["street"];
      _city.text = jsonPosts["city"];
      _valCountryCode = jsonPosts["country_code"];
      date = DateTime.parse(jsonPosts["dob"]);
      _dateOfBirth.text = DateFormat("yyyy-MM-dd").format(date);
      _valGender = jsonPosts["gender"];
      profPic = jsonPosts["profile_picture"];

      setState(() {
        isLoad = false;
      });
    } else {
      Alerts.showMessageForResponse(context, response);
      print('responce failure');
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                          "asset/images/prof.png",
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
                          labelText: "First Name",
                          labelStyle: HintTextStyle_1,
                          controller: _firstName,
                          keyboardType: TextInputType.text,
                        ),
                        CustomTextField(
                          labelText: "Last Name",
                          labelStyle: HintTextStyle_1,
                          controller: _lastName,
                          keyboardType: TextInputType.text,
                        ),
                        Opacity(
                          opacity: 0.6,
                          child: CustomTextField(
                            labelText: "Email Address",
                            labelStyle: HintTextStyle_1,
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            readOnly: true,
                          ),
                        ),
                        Opacity(
                          opacity: 0.6,
                          child: CustomTextField(
                            labelText: "Mobile Number",
                            labelStyle: HintTextStyle_1,
                            maxLength: 10,
                            controller: _mobileNumber,
                            keyboardType: TextInputType.phone,
                            readOnly: true,
                          ),
                        ),
                        CustomTextField(
                          labelText: "Postcode",
                          labelStyle: HintTextStyle_1,
                          controller: _postCode,
                          keyboardType: TextInputType.number,
                        ),
                        CustomTextField(
                          labelText: "Street",
                          labelStyle: HintTextStyle_1,
                          controller: _street,
                          keyboardType: TextInputType.multiline,
                        ),
                        CustomTextField(
                          labelText: "City",
                          labelStyle: HintTextStyle_1,
                          controller: _city,
                          keyboardType: TextInputType.multiline,
                        ),
                        Container(
                            height: 52.0,
                            margin: EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFf4f3f0),
                              // borderRadius: BorderRadius.circular(4.0),
                              // border: defaultBorder
                            ),
                            child: DropdownButtonFormField(
                                icon: CircleAvatar(
                                  backgroundColor: Color(0XFFDADCDC),
                                  radius: 9.0,
                                  child: Center(
                                    child: Icon(
                                      Icons.expand_more,
                                      color: Color(0XFF727C8E),
                                      size: 15.0,
                                    ),
                                  ),
                                ),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(25.0, 20.0, 20, 10),
                                    labelText: 'Country Code',
                                    labelStyle: HintTextStyle_1,
                                    enabledBorder: enabledBorder,
                                    // focusedBorder: enabledBorder,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto
                                    //  errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null
                                    ),
                                isExpanded: true,
                                dropdownColor: Color(0xffF1F0EC),
                                value: _valCountryCode,
                                hint: Text('Country Code',
                                    style: HintTextStyle_1),
                                items: _countrycode.map((String dropdownItem) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      dropdownItem,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    value: dropdownItem,
                                  );
                                }).toList(),
                                onChanged: (String selectedValue) {
                                  setState(() {
                                    this._valCountryCode = selectedValue;
                                  });
                                })),
                        GestureDetector(
                            onTap: _selectDob,
                            child: AbsorbPointer(
                              child: CustomTextField(
                                labelText: "Date Of Birth",
                                labelStyle: HintTextStyle_1,
                                controller: _dateOfBirth,
                                keyboardType: null,
                                readOnly: true,
                              ),
                            )),
                        SizedBox(height: 9.0),
                        Container(
                            height: 52.0,
                            margin: EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFf4f3f0),
                              // borderRadius: BorderRadius.circular(4.0),
                              // border: defaultBorder
                            ),
                            child: DropdownButtonFormField(
                                icon: CircleAvatar(
                                  backgroundColor: Color(0XFFDADCDC),
                                  radius: 9.0,
                                  child: Center(
                                    child: Icon(
                                      Icons.expand_more,
                                      color: Color(0XFF727C8E),
                                      size: 15.0,
                                    ),
                                  ),
                                ),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(25.0, 20.0, 20, 10),
                                    labelText: 'Gender',
                                    labelStyle: HintTextStyle_1,
                                    enabledBorder: enabledBorder,
                                    // focusedBorder: enabledBorder,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto
                                    //  errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null
                                    ),
                                isExpanded: true,
                                dropdownColor: Color(0xffF1F0EC),
                                value: _valGender,
                                hint: Text('Gender', style: HintTextStyle_1),
                                items: _listGender.map((String dropdownItem) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      dropdownItem,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    value: dropdownItem,
                                  );
                                }).toList(),
                                onChanged: (String selectedValue) {
                                  setState(() {
                                    this._valGender = selectedValue;
                                  });
                                })),
                        SizedBox(height: 10.0),
                        _updateButton(),
                      ],
                    )),
                  ),
                ),
              ],
            ),
    );
  }

  void _selectDob() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2101));
    if (picked != null && picked != _dob) {
      setState(() {
        _dob = picked;
        print(picked);
        _dateOfBirth.text = DateFormat("yyyy-MM-dd").format(_dob);
      });
    }
  }

  Widget _updateButton() {
    return GestureDetector(
      child: SizedBox(
          height: 57.0,
          child: Container(
              alignment: AlignmentDirectional.bottomStart,
              decoration: (_firstName.text != jsonPosts["first_name"] ||
                      _lastName.text != jsonPosts["last_name"] ||
                      _postCode.text != jsonPosts["post_code"] ||
                      _street.text != jsonPosts["street"] ||
                      _valCountryCode != jsonPosts["country_code"] ||
                      _valGender != jsonPosts["gender"] ||
                      _city.text != jsonPosts["city"] ||
                      _valCountryCode != jsonPosts["country_code"] ||
                      _dateOfBirth.text !=
                          DateFormat("yyyy-MM-dd")
                              .format(DateTime.parse(jsonPosts["dob"])) ||
                      _valGender != jsonPosts["gender"] ||
                      profPic != jsonPosts["profile_picture"])
                  ? buttonDecoration
                  : disableButtonDecoration,
              child: Center(
                child: Text('Update',
                    style: TextStyle(
                        fontFamily: DefaultFont,
                        fontWeight: FontWeight.w600,
                        color: !(_firstName.text != jsonPosts["first_name"] ||
                                _lastName.text != jsonPosts["last_name"] ||
                                _postCode.text != jsonPosts["post_code"] ||
                                _street.text != jsonPosts["street"] ||
                                _valCountryCode != jsonPosts["country_code"] ||
                                _valGender != jsonPosts["gender"] ||
                                _city.text != jsonPosts["city"] ||
                                _valCountryCode != jsonPosts["country_code"] ||
                                _dateOfBirth.text !=
                                    DateFormat("yyyy-MM-dd").format(
                                        DateTime.parse(jsonPosts["dob"])) ||
                                _valGender != jsonPosts["gender"] ||
                                profPic != jsonPosts["profile_picture"])
                            ? Colors.grey
                            : Colors.white,
                        fontSize: 16.0)),
              ))),
      onTap: () {
        if (_firstName.text != jsonPosts["first_name"] ||
            _lastName.text != jsonPosts["last_name"] ||
            _postCode.text != jsonPosts["post_code"] ||
            _street.text != jsonPosts["street"] ||
            _valCountryCode != jsonPosts["country_code"] ||
            _valGender != jsonPosts["gender"] ||
            _city.text != jsonPosts["city"] ||
            _valCountryCode != jsonPosts["country_code"] ||
            _dateOfBirth.text !=
                DateFormat("yyyy-MM-dd")
                    .format(DateTime.parse(jsonPosts["dob"])) ||
            _valGender != jsonPosts["gender"] ||
            profPic != jsonPosts["profile_picture"]) {
          updateUser(
              _firstName.text,
              _lastName.text,
              _postCode.text,
              _street.text,
              _city.text,
              _image,
              _valGender,
              _valCountryCode,
              _dateOfBirth.text);
        } else {}
      },
    );
  }

  void updateUser(
      String firstName,
      String lastName,
      String postCode,
      String street,
      String city,
      File file,
      String gender,
      String countryCode,
      String dob) async {
    _progressDialog = new ProgressDlg(context);
    _progressDialog.show();
    final responses = await ApiCalls.updateUser(firstName, lastName, postCode,
        street, city, file, gender, countryCode, dob);

    print(responses.jsonBody);
    _progressDialog.hide();
    if (responses.isSuccess) {
      Settings.setLastName(lastName);
      Settings.setEmail(_email.text);
      Settings.setMobile(_mobileNumber.text);
      _progressDialog.hide();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
    } else {
      Alerts.showMessageForResponse(context, responses);
    }
  }
}
