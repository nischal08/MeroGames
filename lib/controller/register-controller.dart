import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merogames/api/api_end_point.dart';
import 'package:merogames/models/RegisterResponse.dart';
import 'package:merogames/screen/login-screen.dart';
import 'package:merogames/screen/otp-screen.dart';

class RegisterController extends ChangeNotifier {
  void onClickbackBtn(BuildContext context) {
    Navigator.pop(context);
    // notifyListeners();
  }

  String _responseId;
  String _responseMessage;
  String get responseId => this._responseId;

  set responseId(String value) => this._responseId = value;

  get responseMessage => this._responseMessage;

  set responseMessage(value) => this._responseMessage = value;

  dynamic onClickCreateAccount(
      {fname, lname, phoneNumber, password, confirmPassword, context}) async {
    RegisterResponse response;
    if (password == confirmPassword) {
      response = await ApiEndPoint().userRegister(
        fname: fname,
        lname: lname,
        phoneNumber: phoneNumber,
        pass: password,
        confirmPass: confirmPassword,
      );
      // debugPrint("id: ${response.id}");
      // debugPrint("response: ${response.message}");

      _responseId = response.id;
      _responseMessage = response.message;

      notifyListeners();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OtpScreen(number: phoneNumber, userRegisteredId: _responseId),
        ),
      );
    } else {
      return AlertDialog(
        title: Text("Password Error"),
        content: Text("Password and confirm Password should match\n !!retry!!"),
      );
    }

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => LoginScreen(),
    //   ),
    // );
  }

  void onClickLogin(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
