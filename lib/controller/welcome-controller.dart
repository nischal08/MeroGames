import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:merogames/screen/login-screen.dart';
import 'package:merogames/screen/register-screen.dart';

class WelcomeController extends ChangeNotifier {
  void onClickLogIn(BuildContext context) {
Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );

  }
  void onClickCreateAcc(BuildContext context) {
Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterScreen(),
              ),
            );

  }
}
