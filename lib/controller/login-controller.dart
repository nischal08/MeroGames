import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merogames/api/auth-service.dart';
import 'package:merogames/models/LoginResponse.dart';
import 'package:merogames/screen/home-screen.dart';
import 'package:merogames/screen/register-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  String _sessionToken;
  String get sessionToken => this._sessionToken;

  set sessionToken(String value) => this._sessionToken = value;

  LoginResponse _loginResponse;
  bool showProgressBar = false;

  String response;
  var authInfo;
  void onClickBackBtn(BuildContext context) {
    Navigator.pop(context);
    // notifyListeners();
  }

  void setCircularSpinner() {
    showProgressBar = !showProgressBar;
    notifyListeners();
  }

  Future onClickSaveBtn({
    String sessionToken,
    // String identity,
    // String password,
    context,
  }) async {
    _sessionToken = sessionToken;
    // print("THis is my own ${_sessionToken}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sessionToken, _sessionToken);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
    var sharedPrefSessionToken = prefs.getString(sessionToken);
    print("SharedPerferences token value :${sharedPrefSessionToken}");

    // final LoginResponse login =
    //     await AuthService.loginUser(identity: identity, password: password);
    // _loginResponse = login;
    // print(_loginResponse.sessionToken);
    // notifyListeners();

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => AllHome(),
    //   ),
    // );
  }

  void onClickCreateAcc(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      ),
    );
  }
}
