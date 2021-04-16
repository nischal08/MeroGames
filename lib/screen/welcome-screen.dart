import 'package:flutter/material.dart';
import 'package:merogames/controller/welcome-controller.dart';
import 'package:merogames/widgets/general-elevated-button.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeController _welcomeStateController;

  @override
  Widget build(BuildContext context) {
    _welcomeStateController = Provider.of<WelcomeController>(context);
    return Scaffold(
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            _logo(),
            SizedBox(
              height: 30,
            ),
            _appInfo(context),
            SizedBox(
              height: 50,
            ),
            _buttonGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buttonGrid(BuildContext context) {
    return Column(
      children: [
        GeneralElevatedButton(
          label: 'LogIn Now',
          onPressed: () {
            _welcomeStateController.onClickLogIn(context);
          },
        ),
        SizedBox(
          height: 20,
        ),
        GeneralElevatedButton(
          bgColor: Colors.white,
          label: 'Create Account',
          onPressed: () {
            _welcomeStateController.onClickCreateAcc(context);
          },
        )
      ],
    );
  }

  Widget _logo() {
    return Container(
      width: 300,
      child: Image.asset(
        'assets/neon.png',
      ),
    );
  }

  Widget _appInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome To MeroGames",
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
            width: 300,
            child: Text(
              'A games to over 12 Million player around the global of the world',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 16),
            ))
      ],
    );
  }
}
