import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  final String _baseUrl = "https://merogamesapi.demo-4u.net/";

  Future<dynamic> getWithParams(String url, String query) async {
    var requestUrl;
    if (query.isEmpty) {
      requestUrl = _baseUrl + url;
    } else {
      requestUrl = _baseUrl + url + "?" + query;
    }
    var responseJson;
    try {
      debugPrint("Request body: $requestUrl");
      final response = await http.get(Uri.parse(requestUrl));
      responseJson = _response(response);
    } on SocketException {}
    return responseJson;
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = _response(response);
    } on SocketException {}
    return responseJson;
  }

  Future<dynamic> getWithBaseUrl(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _response(response);
    } on SocketException {}
    return responseJson;
  }

  Future<dynamic> post(String url, String map) async {
    debugPrint("Request body: $map");
    var responseJson;
    try {
      final response = await http
          .post(Uri.parse(_baseUrl + url), body: map, headers: <String, String>{
        'Content-Type': 'application/json',
      });
      responseJson = _response(response);
    } catch (ex) {
      debugPrint("test ${ex.toString()}");
    }
    return responseJson;
  }

  Future<dynamic> uploadFile(String url, File file, String token) async {
    var responseJson;
    var postUri = Uri.parse(_baseUrl + url);

    http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('file', file.path);

    request.files.add(multipartFile);
    request.fields["auth_token"] = token;

    try {
      await request.send().then((responseValue) async {
        responseValue.stream.transform(utf8.decoder).listen((event) {
          switch (responseValue.statusCode) {
            case 200:
              responseJson = json.decode(event);
// debugPrint("Method,Url: ${response.request}");
              debugPrint("Response: $responseJson");
              return responseJson;
            case 400:
            case 401:

            case 403:
            case 404:

            case 500:

            default:
          }
        });
      });
    } on SocketException {}

    return responseJson;
  }

  dynamic _response(http.Response response) {
    debugPrint("Response: ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        debugPrint("Method,Url: ${response.request}");
        debugPrint("Response: $responseJson");
        return responseJson;
      case 400:
      case 401:

      case 403:
      case 404:
      case 500:

      default:
    }
  }
}
