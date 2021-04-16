// To parse this JSON data, do
//
//     final login = loginFromMap(jsonString);

import 'dart:convert';

class Login {
  Login({
    this.identity,
    this.password,
    this.returnUrl,
  });

  final String identity;
  final String password;
  final String returnUrl;

  factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        identity: json["identity"],
        password: json["password"],
        returnUrl: json["returnUrl"],
      );

  Map<String, dynamic> toMap() => {
        "identity": identity,
        "password": password,
        "returnUrl": returnUrl,
      };
}
