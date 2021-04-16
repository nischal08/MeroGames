import 'package:flutter/material.dart';
import 'package:merogames/controller/login-controller.dart';
import 'package:merogames/widgets/custom-textfield.dart';
import 'package:merogames/widgets/general-elevated-button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  LoginController _loginStateController;

  @override
  Widget build(BuildContext context) {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _loginStateController = Provider.of<LoginController>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      _loginStateController.onClickBackBtn(context);
                    },
                    child: _backBtn(context)),
                SizedBox(
                  height: 30,
                ),
                _titleDesc(context),
                SizedBox(
                  height: 50,
                ),
                CustomTextfield(
                  controller: _emailController,
                  label: 'Enter Email',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextfield(
                  obscureText: true,
                  controller: _passwordController,
                  label: 'Enter Password',
                  icon: Icons.lock_outline,
                ),
                SizedBox(
                  height: 50,
                ),
                _generalBtn(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _generalBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GeneralElevatedButton(
          label: 'Get Login',
          onPressed: () {
            print(_emailController.text);
            _loginStateController.onClickSaveBtn(
                email: _emailController.text,
                password: _passwordController.text);
          },
        ),
        SizedBox(
          height: 20,
        ),
        GeneralElevatedButton(
          bgColor: Colors.white,
          label: 'Create Account',
          onPressed: () {
            _loginStateController.onClickCreateAcc(context);
          },
        )
      ],
    );
  }

  Widget _backBtn(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back),
        SizedBox(
          width: 3,
        ),
        Text(
          'Back',
          style: Theme.of(context).textTheme.caption.copyWith(fontSize: 16),
        ),
      ],
    );
  }

  _titleDesc(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Keep Connected".toUpperCase(),
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 340,
          child: Text(
            'Enter your email and password to get access your account',
            // textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 16,
                  height: 1.6,
                ),
          ),
        )
      ],
    );
  }
}
