import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  // final String _baseUrl = "https://192.168.2.50:45456/";
  final String _baseUrl = "https://games.demo-4u.net/";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = _response(response);
    } catch (e) {
      print(e);
    }
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

  dynamic _response(http.Response response) {
    debugPrint("Response: ${response.statusCode}");

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body.toString());
      debugPrint("Method,Url: ${response.request}");
      debugPrint("Response: $responseJson");
      return responseJson;
    }
  }
}
