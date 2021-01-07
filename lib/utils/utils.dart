class Utils {
  static bool validateUsername(String value) {
    if (value.length == 0)
      return false;
    else
      return true;
  }

  static bool validateAddress(String value) {
    if (value.length == 0)
      return false;
    else
      return true;
  }

  static bool validatePostalCode(String value) {
    if (value.length == 0)
      return false;
    else
      return true;
  }

  static bool validateName(String value) {
    if (value.length == 0)
      return false;
    else
      return true;
  }

  static bool validateJournal(String value) {
    if (value.length == 0)
      return false;
    else
      return true;
  }

  static bool validatePhone(String value) {
    if (value != null) {
      return true;
    }
    return false;
  }

  static bool validatePostCode(String value) {
    if (value != null && value.length == 5) {
      return true;
    }
    return false;
  }

  static bool validateOTP(String value) {
    if (value != null && value.length == 6) {
      return true;
    }
    return false;
  }

  static bool validateEmailBool(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static bool validateNIC(String value) {
    if (value != null) {
      if (value.length == 10 && value.toUpperCase().endsWith("V")) {
        return true;
      } else if (value.length == 12 && isNumeric(value)) {
        return true;
      }
    }
    return false;
  }

  static bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static bool validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static String validateNumber(String value) {
    Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Please enter a number.';
    else
      return null;
  }

  static String formatMobileNumber(String value) {
    return value;
  }

  static bool validateLocation(String value) {
    if (value != null) {
      return true;
    }
    return false;
  }

  static bool validateFeedback(String value) {
    if (value.length == 0)
      return false;
    else
      return true;
  }

  static parseUserMe(response) {
    // GlobalUserData globalUserData = globalUserState.value;
    // String type = response.jsonBody['data']['type'];
    // globalUserData.userName =  response.jsonBody['data']['username'];
    // globalUserData.mobileNumber =  response.jsonBody['data']['mobile_no'];
    // if (type != null && type.toLowerCase() == "admin") {
    //   globalUserData.loginType = LoginType.ADMIN;
    // } else if (type != null && type.toLowerCase() == "party_member") {
    //   var region = response.jsonBody['data']['user_regions'][0];
    //   globalUserData.loginType = LoginType.MEMBER;
    //   globalUserData.district = District.fromJson(region['wecan_district']);
    //   globalUserData.electorate =
    //       Electorate.fromJson(region['wecan_electorate']);
    //   globalUserData.pollingBoothId = region['wecan_polling_booth_number'];
    // } else {
    //   globalUserData.loginType = LoginType.USER;
    // }
    // globalUserState.update(globalUserData);
  }
}
