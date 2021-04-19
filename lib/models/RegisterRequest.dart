// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
    RegisterRequest({
        this.role,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.termsOfService,
        this.password,
        this.confirmPassword,
        this.referrer,
    });

    final int role;
    final String firstName;
    final String lastName;
    final String phoneNumber;
    final bool termsOfService;
    final String password;
    final String confirmPassword;
    final String referrer;

    factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
        role: json["role"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        termsOfService: json["termsOfService"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        referrer: json["referrer"],
    );

    Map<String, dynamic> toJson() => {
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
