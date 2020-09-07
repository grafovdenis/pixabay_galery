import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static final _baseUrl = 'https://pixabay.com/api/';
  static final _key = "18210303-a46e09e076be713a4aafd6037";

  static final http.Client httpClient = http.Client();

  static Future<http.Response> get({
    @required String color,
  }) {
    return httpClient.get(_baseUrl + "?key=$_key&q=$color&image_type=photo");
  }
}
