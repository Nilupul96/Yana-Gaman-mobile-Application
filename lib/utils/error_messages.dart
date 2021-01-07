
import 'package:yana_gaman/api/api_response.dart';
import 'package:yana_gaman/api/api_status.dart';

class ErrorMessages {
  static String getErrorMessage(ApiResponse response) {
    switch (response.apiStatus) {
      case ApiStatus.NO_INTERNET:
        return "Internet connection not available";
      case ApiStatus.TIMEOUT:
        return "Request timed out! Please check your connection";
      case ApiStatus.CLIENT_ERROR:
        try {
          if (response.jsonBody != null) {
            String message = response.jsonBody['message'];
            if (message != null && message.length > 0) {
              return message;
            }
          }
        } catch (e) {
          print(e);
        }
        return response.statusMessage;

      case ApiStatus.SERVICE_ERROR:
        return "Sorry, Service unavailable at this moment";
      default:
        return "Sorry, Something went wrong\n" + response.statusMessage;
    }
  }
}
