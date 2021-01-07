import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static setAccessToken(String token) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("access_token", token);
  }

  static setRefreshToken(String token) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("refresh_token", token);
  }

  static setCurrentLocation(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("current_location", value);
  }

  
  static setCurrentScreen(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("currentScreen", value);
  }

  static setCurrentPaymentScreen(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("currentPaymentScreen", value);
  }

  static setEventDetails(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("eventDetails", value);
  }

  static setUserName(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("username", value);
  }

  static setFirstName(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("first_name", value);
  }

  static setLastName(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("last_name", value);
  }

  static setEmail(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("email", value);
  }

  static setMobile(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("mobile", value);
  }

  static setPostCode(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("postCode", value);
  }

 
  static setProfilePic(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("profile_pic", value);
  }

  static setDeliveryCharge(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("delivery_charge", value);
  }

 

 

  static setPlayer(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("player_id", value);
  }

  static Future<double> getItemSubTotalPrice() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getDouble("item_price");
  }

  static Future<String> getPlayer() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("player_id");
  }

 
  static Future<String> getAccessToken() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("access_token");
  }

  static Future<String> getRefreshToken() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("refresh_token");
  }

  static Future<String> getCurrentLocation() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("current_location");
  }

 

  static Future<bool> getRememberMe() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool("remember_me");
  }

  static Future<String> getUserName() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("username");
  }

  static Future<String> getFirstName() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("first_name");
  }

  static Future<String> getLastName() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("last_name");
  }

  static Future<String> getEmail() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("email");
  }

  static Future<String> getMobile() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("mobile");
  }

 
  static Future<String> getProfilePic() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("profile_pic");
  }

  static Future<String> getProvider() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("provider");
  }

  static Future<String> getDeliveryCharge() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("delivery_charge");
  }

  static Future<String> getDeliveryCode() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("delivery_code");
  }

  static setClientName(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("clientName", value);
  }

  static Future<String> getClientName() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("clientName");
  }

  static setClientDevice(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("clientDevice", value);
  }

  static Future<String> getClientDevice() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("clientDevice");
  }

  static setClientDeviceVersion(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("clientDeviceVersion", value);
  }

  static Future<String> getClientDeviceVersion() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("clientDeviceVersion");
  }

  static setClientVersion(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("clientVersion", value);
  }

  static Future<String> getClientVersion() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("clientVersion");
  }

  static setClientSecret(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("clientSecret", value);
  }

  static Future<String> getClientSecret() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("clientSecret");
  }

    static setGender(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("gender", value);
  }

  static Future<String> getGender() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("gender");
  }

      static setDob(String value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("dob", value);
  }

  static Future<String> getDob() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString("dob");
  }
}
