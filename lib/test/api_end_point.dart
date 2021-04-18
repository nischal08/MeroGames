import 'dart:convert';

import 'package:merogames/models/LoginResponse.dart';
import 'package:merogames/test/api_provider.dart';

class ApiEndPoint {
  ApiProvider _provider = ApiProvider();
  Future<LoginResponse> userLogin() async {
    Map<String, String> json = {
      "identity": "saj3sh",
      "password": "podamibe",
      "returnUrl": "string",
    };

    final response = await _provider.post("Account/Login", jsonEncode(json));
    return LoginResponse.fromJson(response);
  }
}
