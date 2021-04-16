import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merogames/screen/login-screen.dart';
import 'package:merogames/screen/register-screen.dart';

class RegisterController extends ChangeNotifier {
  void onClickbackBtn(BuildContext context) {
    Navigator.pop(context);
    // notifyListeners();
  }

  void onClickLogin(context) {

    Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
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
