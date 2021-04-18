// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        this.sessionToken,
    });

    final String sessionToken;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        sessionToken: json["sessionToken"],
    );

    Map<String, dynamic> toJson() => {
        "sessionToken": sessionToken,
    };
}
