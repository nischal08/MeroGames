import 'dart:convert';

import 'package:merogames/models/LoginResponse.dart';
import 'package:merogames/api/api_provider.dart';
import 'package:merogames/models/OtpRequest.dart';
import 'package:merogames/models/OtpResponse.dart';
import 'package:merogames/models/RegisterRequest.dart';
import 'package:merogames/models/RegisterResponse.dart';

class ApiEndPoint {
  ApiProvider _provider = ApiProvider();
  Future<LoginResponse> userLogin({String identity, String password}) async {
    Map<String, String> json = {
      "identity": identity,
      "password": password,
      "returnUrl": "string",
    };

    final response = await _provider.post("Account/Login", jsonEncode(json));
    return LoginResponse.fromJson(response);
  }

  Future<RegisterResponse> userRegister(
      {String fname,
      String lname,
      String phoneNumber,
      String confirmPass,
      String pass}) async {
    // var json = <String,dynamic>{
    //   "role": 0,
    //   "firstName": fname,
    //   "lastName": lname,
    //   "phoneNumber": phoneNumber,
    //   "termsOfService": true,
    //   "password": pass,
    //   "confirmPassword": confirmPass,
    //   "referrer": "string"
    // };
    //
    //

    RegisterRequest reqModel = new RegisterRequest(
      role: 0,
      firstName: fname,
      lastName: lname,
      phoneNumber: phoneNumber,
      termsOfService: true,
      password: pass,
      confirmPassword: confirmPass,
      referrer: "String",
    );

    //  print( "text:"+reqModel.toJson().toString());
    final response =
        await _provider.post("Account/Register", jsonEncode(reqModel.toJson()));

    return RegisterResponse.fromJson(response);
  }

  Future<OtpResponse> otpSend(String otp, String id) async {
    OtpRequest _otpRequest = new OtpRequest(
      id: id,
      resetMethod: 0,
      token: otp,
    );

    final response = await _provider.post(
      "Account/ConfirmOTPCode",
      jsonEncode(
        _otpRequest.toJson(),
      ),
    );

    return OtpResponse.fromJson(response);
  }
}
