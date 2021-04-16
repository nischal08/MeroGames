import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merogames/screen/login-screen.dart';

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
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }
}
