import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:yana_gaman/utils/settings.dart';
import 'api_caller.dart';
import 'api_response.dart';

class ApiCalls {
  static Future<ApiResponse> signUp(
      {String username,
      String firstName,
      String lastName,
      String countryCode,
      String street,
      String city,
      String postCode,
      String email,
      String mobile,
      String dob,
      String gender}) async {
    try {
      String clientName = await Settings.getClientName();
      String clientDevice = await Settings.getClientDevice();
      String clientDeviceVersion = await Settings.getClientDeviceVersion();
      String clientVersion = await Settings.getClientVersion();
      String clientSecret = await Settings.getClientSecret();
      String xAuth = await Settings.getUserName();

      var raw = new Map<String, String>();
      raw['username'] = username;
      raw["firstName"] = firstName;
      raw["lastName"] = lastName;
      raw['email'] = email;
      raw["mobile_number"] = mobile;
      raw['dob'] = dob;
      raw['gender'] = gender;
      raw["country_code"] = countryCode;
      raw["street"] = street;
      raw["city"] = city;
      raw["post_code"] = postCode;
      Map<String, String> headers = new Map();
      headers["Accept"] = "*/*";
      headers["X-OAuth-Client-Name"] = clientName;
      headers["X-OAuth-Client-Device"] = clientDevice;
      headers["X-OAuth-Client-Device-Version"] = clientDeviceVersion;
      headers["X-OAuth-Client-Version"] = clientVersion;
      headers["X-OAuth"] = xAuth;
      headers["X-OAuth-Client-Secret"] = clientSecret;
      return ApiCaller.postRequest('/users/register',
          data: raw, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> logIn(String username) async {
    try {
      var formData = new Map<String, dynamic>();
      formData['client_id'] = 'dilma-app';
      formData['grant_type'] = 'password';
      formData['username'] = username;
      Map<String, String> headers = new Map();
      headers["Accept"] = "*/*";
      return ApiCaller.postRequestLog(
          '/auth/realms/Dilmah/protocol/openid-connect/token',
          data: formData,
          headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> verifyOtp(String username, String otp) async {
    try {
      var formData = new Map<String, dynamic>();
      formData['client_id'] = "dilma-app";
      formData['otp'] = otp;
      formData['grant_type'] = "password";
      formData['username'] = username;

      Map<String, String> headers = new Map();
      headers["Accept"] = "*/*";
      headers["Content-Type"] =
          "application/x-www-form-urlencoded;charset=utf-8";
      return ApiCaller.postRequestLog(
          '/auth/realms/Dilmah/protocol/openid-connect/token',
          headers: headers,
          data: formData);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> updateToken(String refreshToken) async {
    try {
      var formData = new Map<String, dynamic>();
      formData['grant_type'] = "refresh_token";
      formData['client_id'] = "dilma-app";
      formData['client_secret'] = 'password';
      formData['refresh_token'] = refreshToken;

      Map<String, String> headers = new Map();
      headers["Accept"] = "*/*";
      headers["Content-Type"] =
          "application/x-www-form-urlencoded;charset=utf-8";
      return ApiCaller.postRequestLog(
          '/auth/realms/Dilmah/protocol/openid-connect/token',
          headers: headers,
          data: formData);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getMe() async {
    try {
      return ApiCaller.getRequestSplashAuth(
          '/auth/realms/Dilmah/protocol/openid-connect/userinfo');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getItemMaximumCount(
      String channel, String productCode) async {
    try {
      return ApiCaller.getRequestAuth(
          '/product/' + channel + '/' + productCode + '/quantity');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getEventList(String shopType) async {
    try {
      return ApiCaller.getRequestAuth('/events/' + '$shopType');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getEventHistory(String type) async {
    try {
      return ApiCaller.getRequestAuth('/events/history/' + '$type');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> payAndValidateEvent(
      String people, String event, int cardId) async {
    String xAuth = await Settings.getUserName();
    try {
      var raw = new Map<String, dynamic>();
      raw['people'] = people;
      raw['event'] = event;
      raw["cardId"] = cardId.toString();
      Map<String, String> headers = new Map();
      headers['Accept'] = '*/*';
      headers["X-OAuth-Client-Name"] = await Settings.getClientName();
      headers["X-OAuth-Client-Device"] = await Settings.getClientDevice();
      headers["X-OAuth-Client-Device-Version"] =
          await Settings.getClientDeviceVersion();
      headers["X-OAuth-Client-Version"] = await Settings.getClientVersion();
      headers["X-OAuth-Client-Secret"] = await Settings.getClientSecret();
      headers["X-OAuth"] = xAuth;
      headers["X-OAuth-Client-Secret"] = await Settings.getClientSecret();
      return ApiCaller.postRequestAuth('/events/event-bookings/validate',
          data: raw, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getPrivilegesList() async {
    try {
      return ApiCaller.getRequestAuth('/privileges');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getPrivilegesDetails(String id) async {
    try {
      return ApiCaller.getRequestAuth('/privileges/' + '$id');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getJournalList() async {
    try {
      return ApiCaller.getRequestAuth('/journals');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> addpost(String param1, List<File> file) async {
    try {
      var fields = new Map<String, String>();
      fields['description'] = param1;
      List<MultipartFile> files = List();
      if (file != null && file.length > 0) {
        for (var i = 0; i < file.length; i++) {
          final length = await file[i].length();
          MediaType mediaType = new MediaType('image', 'jpeg');
          var filePart = http.MultipartFile(
              'image' + (i + 1).toString(), file[i].openRead(), length,
              contentType: mediaType, filename: 'tea' + '$i' + '.jpg');
          files.add(filePart);
          print('post added');
          print(files.length);
        }
      }
      return ApiCaller.multiPartRequestAuth('/journals',
          fields: fields, files: files);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> updateUser(
      String firstName,
      String lastName,
      String postCode,
      String street,
      String city,
      File file,
      String gender,
      String countryCode,
      String dob) async {
    try {
      var fields = new Map<String, String>();
      fields['first_name'] = firstName;
      fields['last_name'] = lastName;
      fields['dob'] = dob;
      fields['gender'] = gender;
      fields['country_code'] = countryCode;
      fields['street'] = street;
      fields['city'] = city;
      fields['post_code'] = postCode;
      Map<String, String> headers = new Map();
      // headers['Accept'] = '*/*';
      // headers["x-oauth-client-device"] = await Settings.getClientDevice();
      // headers["x-oauth-client-device-version"] = await Settings.getClientDeviceVersion();
      // headers["x-oauth-client-version"] = await Settings.getClientVersion();

      List<MultipartFile> files = List();
      if (file != null && file.existsSync()) {
        final length = await file.length();
        MediaType mediaType = new MediaType('image', 'jpeg');
        var filePart = http.MultipartFile(
            'profile_picture', file.openRead(), length,
            contentType: mediaType, filename: "profilepic.jpg");
        files.add(filePart);
      }

      return ApiCaller.multiPartRequestPutAuth('/users/edit-user',
          headers: headers, fields: fields, files: files);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> playerId(player) async {
    try {
      String xAuth = await Settings.getUserName();

      var raw = new Map<String, String>();
      raw["player_id"] = player;
      print(player);
      Map<String, String> headers = new Map();
      headers['Accept'] = '*/*';
      headers["X-OAuth-Client-Name"] = await Settings.getClientName();
      headers["X-OAuth-Client-Device"] = await Settings.getClientDevice();
      headers["X-OAuth-Client-Device-Version"] =
          await Settings.getClientDeviceVersion();
      headers["X-OAuth-Client-Version"] = await Settings.getClientVersion();
      headers["X-OAuth-Client-Secret"] = await Settings.getClientSecret();
      headers["X-OAuth"] = xAuth;
      headers["X-OAuth-Client-Secret"] = await Settings.getClientSecret();

      return ApiCaller.putRequestAuth('/users/notification/token',
          data: raw, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getTribuneList() async {
    try {
      return ApiCaller.getRequestAuth('/tribunes');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getTribuneDetailsById(int id) async {
    try {
      return ApiCaller.getRequestAuth('/tribunes/' + '$id');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getPromotionListHome(
      String channelGroup, String page) async {
    try {
      Map<String, String> headers = new Map();
      return ApiCaller.getRequestAuth(
          '/promotions/' + '$channelGroup' + '/' + '$page' + '/3',
          headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getPromotionList(
      String channelGroup, String page) async {
    try {
      Map<String, String> headers = new Map();
      return ApiCaller.getRequestAuth(
          '/promotions/' + '$channelGroup' + '/' + '$page' + '/20',
          headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getResturantLocationList(String type) async {
    try {
      return ApiCaller.getRequestAuth('/restaurants/' + '$type' + '/locations');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getSearchLocationList(
      String locationType, String searchText) async {
    try {
      Map<String, String> headers = new Map();
      return ApiCaller.getRequestAuth(
          '/restaurants/' +
              '$locationType' +
              '/locations/?text=' +
              '$searchText',
          headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getSearchItemList(
      String searchType, String channel, String menuType) async {
    try {
      Map<String, String> headers = new Map();
      return ApiCaller.getRequestAuth(
          '/product/search?text=' +
              searchType +
              '&channel=' +
              channel +
              '&category=' +
              menuType,
          headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getMessageList() async {
    try {
      return ApiCaller.getRequestAuth('/inboxes');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getMessageDetails(int id) async {
    try {
      return ApiCaller.getRequestAuth('/inboxes/' + '$id');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getAboutList() async {
    try {
      return ApiCaller.getRequestAuth('/about-us');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getUserDetails() async {
    try {
      return ApiCaller.getRequestAuth('/users/get-user');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> submitFeedback(
      String feedback, int rating, String restaurant) async {
    try {
      var raw = new Map<String, String>();
      raw['feedback'] = feedback;
      raw['rating'] = rating.toString();
      raw['restaurant'] = restaurant;
      Map<String, String> headers = new Map();
      headers['Accept'] = '*/*';
      // headers['Content-Type'] = 'application/json';
      return ApiCaller.postRequestAuth('/feedbacks',
          data: raw, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getResturantReservationDetails(String type) async {
    try {
      return ApiCaller.getRequestAuth('/reservations/meta/' + '$type');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getReservationsByLocation(String code) async {
    try {
      return ApiCaller.getRequestAuth('/reservations/by-location/' + '$code');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getReservationHistory(String type) async {
    try {
      return ApiCaller.getRequestAuth('/reservations/' + '$type');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getFeaturedItems(String shopType) async {
    try {
      return ApiCaller.getRequestAuth('/menu/featured-items/' + shopType);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getDiscoverTea(String shopType) async {
    try {
      return ApiCaller.getRequestAuth('/menu/discover-tea/' + shopType);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getCategoriesByMenuType(
      String shopType, String menuType) async {
    try {
      return ApiCaller.getRequestAuth(
          '/menu/category/' + '$shopType' + '/' + '$menuType');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getOurMenuDetails(String type, String food) async {
    try {
      return ApiCaller.getRequestAuth(
          '/menu/category/' + '$type' + '/' + '$food');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getOurMenuItemList(
      String location, String taxonCode, String page, String limit) async {
    try {
      return ApiCaller.getRequestAuth('/menu/products/' +
          '$location' +
          '/' +
          '$taxonCode' +
          '/' +
          '$page' +
          '/' +
          '$limit');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getItemDetails(String code, String channel) async {
    try {
      return ApiCaller.getRequestAuth(
          '/menu/products/' + '$channel' + '/' + '$code');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getDiscoverItemDetails(
      String code, String channel) async {
    try {
      return ApiCaller.getRequestAuth(
          '/menu/products/' + '$channel' + '/' + '$code');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getNewOrderList(
      String shopType, String orderType, int page, int limit) async {
    try {
      Map<String, String> headers = new Map();
      return ApiCaller.getRequestAuth(
          '/orders/' +
              shopType +
              '/' +
              orderType +
              '/' +
              page.toString() +
              '/' +
              limit.toString(),
          headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getOrderDetails(
      String channel, String token) async {
    try {
      Map<String, String> headers = new Map();
      return ApiCaller.getRequestAuth(
          '/orders/get-details/' + channel + '/' + token,
          headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getDiscoverTeaDetails(String type) async {
    try {
      return ApiCaller.getRequestAuth('/menu?channel=' +
          '$type' +
          '&menuType=beverages&latitude=12.2&longitude=12.3');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> submitAddress(
      String countryCode,
      String deliveryCity,
      String street,
      String postCode,
      String isDefault) async {
    try {
      var raw = new Map<String, dynamic>();
      raw["delivery_city"] = deliveryCity;
      raw["street"] = street;
      raw["country_code"] = countryCode;
      raw["post_code"] = postCode;
      raw["isDefault"] = isDefault;
      Map<String, String> headers = new Map();
      headers['Accept'] = '*/*';
      // headers['Content-Type'] = 'application/json';
      return ApiCaller.putRequestAuth('/delivery-address',
          data: raw, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getDelieveryCitesByChannelGroup(
      String channelGroup) async {
    try {
      return ApiCaller.getRequestAuth('/delivery-cities/' + channelGroup);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getDelieveryOutletsByCity(
      String channelGroup, String delieveryCity) async {
    try {
      return ApiCaller.getRequestAuth(
          '/restaurants/' + channelGroup + '/locations/' + delieveryCity);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getAllCities() async {
    try {
      return ApiCaller.getRequestAuth('/cities/?country=Sri Lanka');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getreservationTimeByLocation(
      String locationCode, String date) async {
    try {
      return ApiCaller.getRequestAuth(
          '/reservations/by-location/' + '$locationCode' + '?date=' + '$date');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getAddressHistory() async {
    try {
      return ApiCaller.getRequestAuth('/delivery-address');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getLoyaltyPointScreen() async {
    try {
      return ApiCaller.getRequestAuth('/loyalty/details');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> geLoyaltyUserPointScreen() async {
    try {
      return ApiCaller.getRequestAuth('/loyalty');
    } catch (e) {
      ApiResponse response = ApiResponse();
      print("Response" + response.toString());
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> checkout(String channel, String shippingMethod,
      String paymentMethod, dynamic productList, dynamic address) async {
    try {
      var raw = new Map<String, dynamic>();
      raw["address"] = address;
      raw["products"] = productList;
      raw["shipping"] = shippingMethod;
      raw["payment"] = paymentMethod;
      Map<String, String> headers = new Map();
      headers['Accept'] = '*/*';
      return ApiCaller.postRequestAuth('/cart/checkout/' + channel,
          data: raw, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> checkoutComplete(
      {String cartToken,
      String payMethod,
      String orderNum,
      String channel,
      String promoCode}) async {
    try {
      String clientName = await Settings.getClientName();
      String clientDevice = await Settings.getClientDevice();
      String clientDeviceVersion = await Settings.getClientDeviceVersion();
      String clientVersion = await Settings.getClientVersion();
      String clientSecret = await Settings.getClientSecret();
      String xAuth = await Settings.getUserName();
      var raw = new Map<String, String>();
      raw['cartToken'] = cartToken;
      raw['payment'] = payMethod;
      raw['orderNumber'] = orderNum;
      raw['promotion_code'] = promoCode;
      Map<String, String> headers = new Map();
      headers['Accept'] = '*/*';
      headers["lang"] = "en";
      headers["X-OAuth-Client-Name"] = clientName;
      headers["X-OAuth-Client-Device"] = clientDevice;
      headers["X-OAuth-Client-Device-Version"] = clientDeviceVersion;
      headers["X-OAuth-Client-Version"] = clientVersion;
      headers["X-OAuth"] = xAuth;
      headers["X-OAuth-Client-Secret"] = clientSecret;

      // headers['Content-Type'] = 'application/json';
      return ApiCaller.postRequestAuth(
          '/cart/checkout/' + channel + '/complete',
          data: raw,
          headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getCardList() async {
    try {
      return ApiCaller.getRequestAuth('/card/get-all');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> checkStatus(String orderNum) async {
    try {
      return ApiCaller.getRequestAuth('/card/check-payment/' + orderNum);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> verifyCard() async {
    try {
      return ApiCaller.getRequestAuth('/card/verify-card');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> deleteCard(String id) async {
    try {
      return ApiCaller.deleteRequestAuth('/card/' + id);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getPromotionDetails(
      String channel, String code) async {
    try {
      return ApiCaller.getRequestAuth(
          '/promotions/' + '$channel' + '/' + '$code');
    } catch (e) {
      ApiResponse response = ApiResponse();
      print("Response" + response.toString());
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getTaxRate(String channel) async {
    try {
      return ApiCaller.getRequestAuth('/cart/get-tax-rate/' + '$channel');
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> submitBill(String channel, double bill) async {
    try {
      var raw = new Map<String, String>();
      raw['channel'] = channel;
      raw['bill'] = bill.toString();
      Map<String, String> headers = new Map();
      headers['Accept'] = '*/*';
      return ApiCaller.postRequestAuth('/loyalty/collectsimulation',
          data: raw, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }
}
