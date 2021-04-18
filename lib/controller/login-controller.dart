import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merogames/api/auth-service.dart';
import 'package:merogames/models/LoginResponse.dart';
import 'package:merogames/screen/register-screen.dart';

class LoginController extends ChangeNotifier {
  LoginResponse _loginResponse;
  bool showProgressBar = false;

  String response;
  var authInfo;
  void onClickBackBtn(BuildContext context) {
    Navigator.pop(context);
    // notifyListeners();
  }

  Future onClickSaveBtn({String identity, String password, context}) async {
    final LoginResponse login =
        await AuthService.loginUser(identity: identity, password: password);
    _loginResponse = login;
    print(_loginResponse.sessionToken);
    notifyListeners();

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
