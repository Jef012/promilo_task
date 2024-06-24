import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../constants/appUrl.dart';
import 'package:http/http.dart' as https;

class ApiBaseHelper {
  String _baseUrl = AppUrls.baseApi;
  late String authToken;

  // Future<dynamic> getAuthToken() async {
  //   SharedPreferences sharedUser = await SharedPreferences.getInstance();
  //   return sharedUser.getString('authToken');
  // }
  //
  // Future<dynamic> getUserId() async {
  //   SharedPreferences sharedUser = await SharedPreferences.getInstance();
  //   return sharedUser.getString('userId');
  // }

  Future<dynamic> get(
    String url,
  ) async {
    try {
      var apiUrl = '$_baseUrl$url';

      final uri = Uri.parse(apiUrl);
      apiUrl = uri.toString();

      final response = await https.get(
        Uri.parse(apiUrl),
        headers: {},
      );

      final responseJson = json.decode(response.body);

      if (response.statusCode == 200) {
        return responseJson;
      } else {
        throw ('${responseJson["meta"]['message']}');
      }
    } on SocketException {
      throw ('No Internet connection');
    }
  }

  // Future<dynamic> post(String url, data) async {
  //   try {
  //     authToken = await getAuthToken();
  //     print("authToken :: $authToken");
  //     final response = await https.post(
  //       Uri.parse('$_baseUrl/$url'),
  //       headers: {
  //         "Content-Type": "application/json; charset=UTF-8",
  //         "Authorization": authToken,
  //       },
  //       body: jsonEncode(data),
  //     );
  //     var responseJson = json.decode(response.body);
  //     if (response.statusCode == 200) {
  //       print("data responseJson :: $responseJson");
  //       return responseJson;
  //     } else {
  //       throw ('${responseJson["meta"]['message']}');
  //     }
  //   } on SocketException {
  //     throw ('No Internet connection');
  //   }
  // }
  //
  // Future<dynamic> put(String url, data) async {
  //   try {
  //     authToken = await getAuthToken();
  //     final response = await https.put(
  //       Uri.parse('$_baseUrl/$url'),
  //       headers: {
  //         "Content-Type": "application/json; charset=UTF-8",
  //         "Authorization": authToken,
  //       },
  //       body: json.encode(data),
  //     );
  //     var responseJson = json.decode(response.body);
  //     if (response.statusCode == 200) {
  //       return responseJson;
  //     } else {
  //       throw ('${responseJson["meta"]['message']}');
  //     }
  //   } on SocketException {
  //     throw ('No Internet connection');
  //   }
  // }
  //
  // Future<dynamic> delete(String url) async {
  //   var responseJson;
  //   try {
  //     authToken = await getAuthToken();
  //     final response = await https.delete(
  //       Uri.parse('$_baseUrl/$url'),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": authToken,
  //       },
  //     );
  //     responseJson = _returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  dynamic _returnResponse(https.Response res) {
    var obj = json.decode(res.body.toString());
    switch (res.statusCode) {
      case 200 || 409:
        var responseJson = json.decode(res.body.toString());
        return responseJson;
      case 400:
        throw obj["meta"]["message"];
      case 401:
      case 403:
        throw obj["meta"]["message"];
      case 500:
      default:
        throw 'Something went wrong!';
    }
  }
}
