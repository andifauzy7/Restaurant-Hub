
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'custom_exception.dart';

class RequestData {
  static final pathURL = 'restaurant-api.dicoding.dev';

  static dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  static Future<dynamic> get(String url, Map<String, dynamic> queryParameter) async {
    var responseJson;
    var uri = Uri.https(pathURL, url, queryParameter);
    print(uri.toString());

    try {
      final response = await http.get(uri);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}