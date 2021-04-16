import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merogames/screen/all-home.dart';

import 'package:merogames/screen/home-screen.dart';
import 'package:merogames/screen/register-screen.dart';

class LoginController extends ChangeNotifier {
  bool showProgressBar = false;
  String identity;
  String password;
  var authInfo;
  void onClickBackBtn(BuildContext context) {
    Navigator.pop(context);
    // notifyListeners();
  }

  void onClickSaveBtn({String identity, String password, context}) async {
    // authInfo = AuthService();
    // this.identity = identity;
    // this.password = password;
    // notifyListeners();
    // final res = await authInfo.login(identity: identity, password: password);
    // final data = jsonDecode(res);
    // if (data['statusCode'] == 200) {
    //   print('Succesful registered');
    // }
    showProgressBar = true;
    notifyListeners();
    await Future.delayed(
      Duration(seconds: 2),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllHome(),
      ),
    );
    showProgressBar = false;
    notifyListeners();
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
