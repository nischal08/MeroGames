// To parse this JSON data, do
//
//     final otpRequest = otpRequestFromJson(jsonString);

import 'dart:convert';

OtpRequest otpRequestFromJson(String str) => OtpRequest.fromJson(json.decode(str));

String otpRequestToJson(OtpRequest data) => json.encode(data.toJson());

class OtpRequest {
    OtpRequest({
        this.id,
        this.token,
        this.resetMethod,
    });

    final String id;
    final String token;
    final int resetMethod;

    factory OtpRequest.fromJson(Map<String, dynamic> json) => OtpRequest(
        id: json["id"],
        token: json["token"],
        resetMethod: json["resetMethod"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "resetMethod": resetMethod,
    };
}
