import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as https;

import 'app_exceptions.dart';

class ApiBaseHelper {
  late String authToken;

  Future<dynamic> authenticationPost(String url, data) async {
    var responseJson;
    var encodedData = Uri(queryParameters: data).query;
    print("DATA >>> $encodedData");
    try {
      final response = await https.post(
        Uri.parse('$url'),
        headers: {
          "Content-Type": 'application/x-www-form-urlencoded',
          "Authorization": "Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==",
        },
        body: encodedData,
      );
      print("Response :: $response");
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(https.Response res) {
    var obj = json.decode(res.body.toString());
    switch (res.statusCode) {
      case 200:
      case 409:
        var responseJson = json.decode(res.body.toString());
        return responseJson;
      case 400:
      case 401:
      case 403:
        throw obj["status"]["message"];
      case 500:
      default:
        throw 'Something went wrong!';
    }
  }
}
