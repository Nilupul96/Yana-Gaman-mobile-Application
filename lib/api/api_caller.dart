import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:yana_gaman/utils/settings.dart';
import 'api_response.dart';
import 'api_status.dart';

const baseUrl = "https://dilmah-ecom-bff.devops.arimac.xyz/api/mobile-bff";
const baseUrlAuth = "https://dilmah-ecom-bff.devops.arimac.xyz";
String currentAccessToken =
    "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJfbmpOMzJOVDZQVldIbll6YUlDbnctTXVnOHc5M1h6UkNZN3JlS3pRWjRRIn0.eyJleHAiOjE2MDUwMDUxOTQsImlhdCI6MTYwNDU3MzE5NCwianRpIjoiYTM4NzU0Y2QtZTMwMi00YzhkLWFkNGMtYzAwYTE3NjQ1Nzg0IiwiaXNzIjoiaHR0cDovL2lkcC10ZXN0LmRldm9wcy5hcmltYWMueHl6L2F1dGgvcmVhbG1zL0RpbG1haCIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiIyZmJlYzRlYS02NDQyLTRiY2ItOTU3NS0yYzIxOGIwNDcxMDAiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJkaWxtYS1hcHAiLCJzZXNzaW9uX3N0YXRlIjoiNDgwOTBmNmUtNGNjNi00NjI4LWIwYzMtNzQ3YTRhNTMxNDMwIiwiYWNyIjoiMSIsImFsbG93ZWQtb3JpZ2lucyI6WyJodHRwOi8vbG9jYWxob3N0OjMwMDAvKiIsImh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC8iXSwicmVzb3VyY2VfYWNjZXNzIjp7ImRpbG1hLWFwcCI6eyJyb2xlcyI6WyJDVVNUT01FUiJdfSwiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiJsb3lhbHR5X2lkIHByb2ZpbGUgY2FydF90b2tlbiBlbWFpbCIsInJlYWxtX2FjY2Vzc3kiOnsicm9sZXMiOlsiQVBQIiwic2F2ZVByb2R1Y3RBdHRyaWJ1dGUiLCJnZXRQcm9kdWN0Iiwic2F2ZUFzc29jaWF0aW9uIiwiZ2V0UHJvZHVjdEFzc29jaWF0aW9uRGV0YWlscyIsImdldEJyYW5kIiwiZ2V0VGF4b25DbXMiLCJzYXZlQ2hhbm5lbFByb2R1Y3QiLCJzYXZlT3B0aW9uIiwiZ2V0UHJvZHVjdEFzc29jaWF0aW9uIiwic2F2ZUJyYW5kIiwic2F2ZVByb2R1Y3QiLCJFQ09NX0NNUyIsImdldFByb2R1Y3RvcHRpb24iLCJzYXZlQ2hhbm5lbCIsImdldFByb2R1Y3RvcHRpb25EZXRhaWxzIiwiZ2V0Q2hhbm5lbCIsInNhdmVWZXJpYXRpb24iLCJnZXRWZXJpYXRpb24iLCJvZmZsaW5lX2FjY2VzcyIsImdldFByb2R1Y3RBdHRyaWJ1dGUiLCJ1bWFfYXV0aG9yaXphdGlvbiIsInNhdmVQcm9kdWN0T3B0aW9uIiwiZ2V0Q2hhbm5lbFByb2R1Y3QiXX0sImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwibmFtZSI6Imh5c2hhbSBoYXNoaW0iLCJjYXJ0X3Rva2VuIjoiMmUzNWI4NDEtZDI3Ny00MjQ1LTk4ZTgtYWM4ZmM1MmRkNjJiIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiOTQ3Nzg4NTAwODgiLCJnaXZlbl9uYW1lIjoiaHlzaGFtIiwibG95YWx0eV9pZCI6IjUxMDAxMDAwMjM0MSIsImZhbWlseV9uYW1lIjoiaGFzaGltIiwiZW1haWwiOiJoeXNoYW1AZ21haWwuY29tIn0.DHES_w0qdfBm5mb8c2USY6tGBV-5YQ870v9wp3ftvV9paqcerM-0uvfII8vMu0v-O4eZstkBPEA6c-cqQmDtElBlzngxWtu-uKbFE2Tq6rirgF_n8mTdBQTzFdq9bsgl4ZJa3LPyyCaoM_v6EDAt4O4CPs1tPX2UTdXTX2GxupdwSILDTmQ1b_rq6PN1q_QF4ZEJzsgKrMM4_f5bL2BFmk1Tx4T-6Tlkp6K2RlwG4TAu3Ry-xID3mtLt8aY1aBsU_UHabbaaSPcmtxvXnfOGInxi0G9aRphafzaJwpfCbV5qeb-i_n-HeW6lb9F83L5fm7yrhnsBoGkj8s802ZXhyQ";
const timeout = 25;

class ApiCaller {
  static Future<ApiResponse> getRequestAuth(String endpoint,
      {Map<String, String> headers}) async {
    try {
      //  String accessToken = currentAccessToken;
      String clientName = await Settings.getClientName();
      String clientDevice = await Settings.getClientDevice();
      String clientDeviceVersion = await Settings.getClientDeviceVersion();
      String clientVersion = await Settings.getClientVersion();
      String clientSecret = await Settings.getClientSecret();

      String accessToken = await Settings.getAccessToken();
      String xAuth = await Settings.getUserName();
      Map<String, String> allHeaders = new Map();
      if (accessToken != null && accessToken.length > 0) {
        print('accsess token add');
        print(xAuth);
        allHeaders["Authorization"] = "Bearer " + accessToken;
        allHeaders["lang"] = "en";
        allHeaders["X-OAuth-Client-Name"] = clientName;
        allHeaders["X-OAuth-Client-Device"] = clientDevice;
        allHeaders["X-OAuth-Client-Device-Version"] = clientDeviceVersion;
        allHeaders["X-OAuth-Client-Version"] = clientVersion;
        allHeaders["X-OAuth"] = xAuth;
        allHeaders["X-OAuth-Client-Secret"] = clientSecret;
      }
      if (headers != null && headers.length > 0) {
        allHeaders.addAll(headers);
      }
      return getRequest(endpoint, headers: allHeaders);
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> getRequest(String endpoint,
      {Map<String, String> headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Map<String, String> allHeaders = new Map();

        if (headers != null && headers.length > 0) {
          allHeaders.addAll(headers);
        }
        print("Url: " + baseUrl + endpoint);
        final response = await http
            .get(baseUrl + endpoint, headers: headers)
            .timeout(const Duration(seconds: timeout));
        print('testing point 1');
        print("Response: " +
            response.body +
            " Code: " +
            response.statusCode.toString());

        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> getRequestSplashAuth(String endpoint,
      {Map<String, String> headers}) async {
    try {
      // String accessToken = currentAccessToken;
      String clientName = await Settings.getClientName();
      String clientDevice = await Settings.getClientDevice();
      String clientDeviceVersion = await Settings.getClientDeviceVersion();
      String clientVersion = await Settings.getClientVersion();
      String clientSecret = await Settings.getClientSecret();

      String accessToken = await Settings.getAccessToken();

      String xAuth = await Settings.getUserName();
      Map<String, String> allHeaders = new Map();
      if (accessToken != null && accessToken.length > 0) {
        print('accsess token add');
        allHeaders["Authorization"] = "Bearer " + accessToken;
        allHeaders["lang"] = "en";
        allHeaders["X-OAuth-Client-Name"] = clientName;
        allHeaders["X-OAuth-Client-Device"] = clientDevice;
        allHeaders["X-OAuth-Client-Device-Version"] = clientDeviceVersion;
        allHeaders["X-OAuth-Client-Version"] = clientVersion;
        allHeaders["X-OAuth"] = xAuth;
        allHeaders["X-OAuth-Client-Secret"] = clientSecret;
      }
      if (headers != null && headers.length > 0) {
        allHeaders.addAll(headers);
      }
      return getRequestSplash(endpoint, headers: allHeaders);
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> getRequestSplash(String endpoint,
      {Map<String, String> headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Map<String, String> allHeaders = new Map();

        if (headers != null && headers.length > 0) {
          allHeaders.addAll(headers);
        }
        print("Url: " + baseUrlAuth + endpoint);
        final response = await http
            .get(baseUrlAuth + endpoint, headers: headers)
            .timeout(const Duration(seconds: timeout));
        print('testing point 1');
        print("Response: " +
            response.body +
            " Code: " +
            response.statusCode.toString());

        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> postRequestAuth(String endpoint,
      {Map<String, dynamic> data, Map<String, String> headers}) async {
    try {
      String accessToken = await Settings.getAccessToken();
      Map<String, String> allHeaders = new Map();
      if (accessToken != null && accessToken.length > 0) {
        print('accsess token add');
        allHeaders["Authorization"] = "Bearer " + accessToken;
      }
      if (data == null) {
        allHeaders["Content-Type"] = "application/json";
      }
      if (headers != null && headers.length > 0) {
        allHeaders.addAll(headers);
      }
      return postRequest(endpoint, data: data, headers: allHeaders);
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> postRequest(String endpoint,
      {Map<String, dynamic> data, Map<String, String> headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Map<String, String> allHeaders = new Map();
        allHeaders["Accept"] = "application/json";
        if (headers != null && headers.length > 0) {
          allHeaders.addAll(headers);
        }
        print("Url: " + baseUrl + endpoint);
        print(data);

        final response = await http
            .post(
              baseUrl + endpoint,
              headers: allHeaders,
              body: data,
            )
            .timeout(const Duration(seconds: timeout));

        print("Response: " +
            response.body +
            " Code: " +
            response.statusCode.toString());
        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> postRequestLog(String endpoint,
      {Map<String, dynamic> data, Map<String, String> headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Map<String, String> allHeaders = new Map();
        allHeaders["Accept"] = "application/x-www-form-urlencoded";
        if (headers != null && headers.length > 0) {
          allHeaders.addAll(headers);
        }
        print("Url: " + baseUrlAuth + endpoint);
        print(data);
        print(allHeaders);

        final response = await http
            .post(
              baseUrlAuth + endpoint,
              headers: allHeaders,
              body: data,
            )
            .timeout(const Duration(seconds: timeout));

        print("Response: " +
            response.body +
            " Code: " +
            response.statusCode.toString());
        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> putRequestAuth(String endpoint,
      {Map<String, dynamic> data, Map<String, String> headers}) async {
    try {
      // String accessToken = currentAccessToken;
      String accessToken = await Settings.getAccessToken();
      Map<String, String> allHeaders = new Map();
      if (accessToken != null && accessToken.length > 0) {
        print('accsess token add');
        allHeaders["Authorization"] = "Bearer " + accessToken;
      }
      if (data == null) {
        // String accessToken = await Settings.getAccessToken();
        allHeaders["Content-Type"] = "application/json";
      }
      if (headers != null && headers.length > 0) {
        allHeaders.addAll(headers);
      }
      return putRequest(endpoint, data: data, headers: allHeaders);
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> putRequest(String endpoint,
      {Map<String, dynamic> data, Map<String, String> headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Map<String, String> allHeaders = new Map();
        allHeaders["Accept"] = "*/*";
        if (headers != null && headers.length > 0) {
          allHeaders.addAll(headers);
        }
        print("Url: " + baseUrl + endpoint);
        final response = await http
            .put(
              baseUrl + endpoint,
              headers: allHeaders,
              body: data,
            )
            .timeout(const Duration(seconds: timeout));
        print("Response: " +
            response.body +
            " Code: " +
            response.statusCode.toString());
        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> deleteRequestAuth(String endpoint,
      {Map<String, dynamic> data, Map<String, String> headers}) async {
    try {
      // String accessToken = currentAccessToken;
      String clientName = await Settings.getClientName();
      String clientDevice = await Settings.getClientDevice();
      String clientDeviceVersion = await Settings.getClientDeviceVersion();
      String clientVersion = await Settings.getClientVersion();
      String clientSecret = await Settings.getClientSecret();
      String accessToken = await Settings.getAccessToken();
      String xAuth = await Settings.getUserName();
      Map<String, String> allHeaders = new Map();
      if (accessToken != null && accessToken.length > 0) {
        print('accsess token add');
        allHeaders["Authorization"] = "Bearer " + accessToken;
        allHeaders["lang"] = "en";
        allHeaders["X-OAuth-Client-Name"] = clientName;
        allHeaders["X-OAuth-Client-Device"] = clientDevice;
        allHeaders["X-OAuth-Client-Device-Version"] = clientDeviceVersion;
        allHeaders["X-OAuth-Client-Version"] = clientVersion;
        allHeaders["X-OAuth"] = xAuth;
        allHeaders["X-OAuth-Client-Secret"] = clientSecret;
      }
      if (data == null) {
        allHeaders["Content-Type"] = "application/json";
      }
      if (headers != null && headers.length > 0) {
        allHeaders.addAll(headers);
      }
      return deleteRequest(endpoint, data: data, headers: allHeaders);
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> deleteRequest(String endpoint,
      {Map<String, dynamic> data, Map<String, String> headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Map<String, String> allHeaders = new Map();
        allHeaders["Accept"] = "application/json";
        if (headers != null && headers.length > 0) {
          allHeaders.addAll(headers);
        }
        print("Url: " + baseUrl + endpoint);
        final response = await http
            .delete(
              baseUrl + endpoint,
              headers: allHeaders,
            )
            .timeout(const Duration(seconds: timeout));
        print("Response: " +
            response.body +
            " Code: " +
            response.statusCode.toString());
        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> multiPartRequestAuth(String endpoint,
      {Map<String, String> fields,
      List<MultipartFile> files,
      Map<String, String> headers}) async {
    try {
      // String accessToken = currentAccessToken;
      String accessToken = await Settings.getAccessToken();
      Map<String, String> allHeaders = new Map();
      if (accessToken != null && accessToken.length > 0) {
        allHeaders["Authorization"] = "Bearer " + accessToken;
      }
      allHeaders["Accept"] = "multipart/form-data";
      if (headers != null && headers.length > 0) {
        allHeaders.addAll(headers);
      }
      print('this point 2');
      return multiPartRequest(endpoint,
          files: files, fields: fields, headers: allHeaders);
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> multiPartRequest(String endpoint,
      {Map<String, String> fields,
      List<MultipartFile> files,
      Map<String, String> headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        final request =
            http.MultipartRequest('POST', Uri.parse(baseUrl + endpoint));
        if (fields != null) {
          request.fields.addAll(fields);
        }
        if (files != null && files.length > 0) {
          request.files.addAll(files);
        }
        if (headers != null && headers.length > 0) {
          request.headers.addAll(headers);
        }
        print("Url: " + baseUrl + endpoint);
        final response = await http.Response.fromStream(await request.send())
            .timeout(const Duration(seconds: timeout));
        print('response' + response.statusCode.toString());
        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> multiPartRequestPutAuth(String endpoint,
      {Map<String, String> fields,
      List<MultipartFile> files,
      Map<String, String> headers}) async {
    try {
      // String accessToken = currentAccessToken;
      String clientName = await Settings.getClientName();
      String clientDevice = await Settings.getClientDevice();
      String clientDeviceVersion = await Settings.getClientDeviceVersion();
      String clientVersion = await Settings.getClientVersion();
      String clientSecret = await Settings.getClientSecret();
      String accessToken = await Settings.getAccessToken();
      String xAuth = await Settings.getUserName();
      Map<String, String> allHeaders = new Map();
      if (accessToken != null && accessToken.length > 0) {
        allHeaders["Authorization"] = "Bearer " + accessToken;
        allHeaders["Accept"] = "multipart/form-data";
        allHeaders["X-OAuth-Client-Name"] = clientName;
        allHeaders["X-OAuth-Client-Device"] = clientDevice;
        allHeaders["X-OAuth-Client-Device-Version"] = clientDeviceVersion;
        allHeaders["X-OAuth-Client-Version"] = clientVersion;
        allHeaders["X-OAuth"] = xAuth;
        allHeaders["X-OAuth-Client-Secret"] = clientSecret;
      }

      if (headers != null && headers.length > 0) {
        allHeaders.addAll(headers);
      }
      print('this point 2');
      return multiPartRequestPut(endpoint,
          files: files, fields: fields, headers: allHeaders);
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> multiPartRequestPut(String endpoint,
      {Map<String, String> fields,
      List<MultipartFile> files,
      Map<String, String> headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        final request =
            http.MultipartRequest('PUT', Uri.parse(baseUrl + endpoint));
        if (fields != null) {
          request.fields.addAll(fields);
        }
        if (files != null && files.length > 0) {
          request.files.addAll(files);
        }
        if (headers != null && headers.length > 0) {
          request.headers.addAll(headers);
        }
        print("Url: " + baseUrl + endpoint);
        final response = await http.Response.fromStream(await request.send())
            .timeout(const Duration(seconds: timeout));
        print('response' + response.statusCode.toString());
        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> jsonRequestAuth(String endpoint,
      {String jsonBody, Map<String, String> headers}) async {
    try {
      // String accessToken = currentAccessToken;
      String accessToken = await Settings.getAccessToken();
      Map<String, String> allHeaders = new Map();
      if (accessToken != null && accessToken.length > 0) {
        allHeaders["Authorization"] = "Bearer " + accessToken;
      }
      allHeaders["Accept"] = "application/json";
      allHeaders["Content-Type"] = "application/json";
      if (headers != null && headers.length > 0) {
        allHeaders.addAll(headers);
      }
      return jsonRequest(endpoint, jsonBody: jsonBody, headers: allHeaders);
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }

  static Future<ApiResponse> jsonRequest(String endpoint,
      {String jsonBody, Map<String, String> headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        final request = http.Request('POST', Uri.parse(baseUrl + endpoint));
        if (headers != null && headers.length > 0) {
          request.headers.addAll(headers);
        }
        request.body = jsonBody;
        print("Url: " + baseUrl + endpoint);
        final response = await http.Response.fromStream(await request.send())
            .timeout(const Duration(seconds: timeout));
        print("Response: " +
            response.body +
            " Code: " +
            response.statusCode.toString());
        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }
}
