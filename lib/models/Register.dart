// To parse this JSON data, do
//
//     final register = registerFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Register {
    Register({
        @required this.role,
        @required this.firstName,
        @required this.lastName,
        @required this.phoneNumber,
        @required this.termsOfService,
        @required this.password,
        @required this.confirmPassword,
        @required this.referrer,
    });

    final int role;
    final String firstName;
    final String lastName;
    final String phoneNumber;
    final bool termsOfService;
    final String password;
    final String confirmPassword;
    final String referrer;

    factory Register.fromJson(String str) => Register.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Register.fromMap(Map<String, dynamic> json) => Register(
        role: json["role"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        termsOfService: json["termsOfService"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        referrer: json["referrer"],
    );

    Map<String, dynamic> toMap() => {
        "role": role,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "termsOfService": termsOfService,
        "password": password,
        "confirmPassword": confirmPassword,
        "referrer": referrer,
    };
}
