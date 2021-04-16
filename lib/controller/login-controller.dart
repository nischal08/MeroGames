import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merogames/api/auth-service.dart';
import 'package:merogames/screen/register-screen.dart';

class LoginController extends ChangeNotifier {
  String identity;
  String password;
  var authInfo;
  void onClickBackBtn(BuildContext context) {
    Navigator.pop(context);
    // notifyListeners();
  }

  void onClickSaveBtn({String identity, String password}) async {
    authInfo = AuthService();
    this.identity = identity;
    this.password = password;
    notifyListeners();
    final res = await authInfo.login(identity: identity, password: password);
    final data = jsonDecode(res);
    if (data['statusCode'] == 200) {
      print('Succesful registered');
    }
  }

  void onClickLogin(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      ),
    );
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
