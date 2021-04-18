import 'package:flutter/material.dart';
import 'package:merogames/controller/register-controller.dart';
import 'package:merogames/widgets/custom-textfield.dart';
import 'package:merogames/widgets/general-elevated-button.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterController _registerStateController;
  @override
  Widget build(BuildContext context) {
    _registerStateController = Provider.of<RegisterController>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      _registerStateController.onClickbackBtn(context);
                    },
                    child: _backBtn(context)),
                SizedBox(
                  height: 30,
                ),
                _titleDesc(context),
                SizedBox(
                  height: 30,
                ),
                _allTextField(context),
                SizedBox(
                  height: 10,
                ),
                _generalBtn(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _allTextField(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          keyboardType: TextInputType.emailAddress,
          label: 'Enter First Name',
          icon: Icons.badge,
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextField(label: 'Enter Last Name', icon: Icons.badge),
        SizedBox(
          height: 20,
        ),
        CustomTextField(
            keyboardType: TextInputType.emailAddress,
            label: 'Enter Phone Number',
            icon: Icons.phone),
        SizedBox(
          height: 20,
        ),
        CustomTextField(label: 'Enter Password', icon: Icons.lock_outline),
        SizedBox(
          height: 20,
        ),
        CustomTextField(
            label: 'ReEnter Password Again', icon: Icons.lock_outline),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _generalBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GeneralElevatedButton(
          bgColor: Colors.white,
          label: 'Create Account',
          onPressed: () {
            _registerStateController.onClickCreateAcc(context);
          },
        ),
        SizedBox(
          height: 20,
        ),
        GeneralElevatedButton(
          label: 'Log In',
          onPressed: () {
            _registerStateController.onClickLogin(context);
          },
        ),
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
          "Start connecting".toUpperCase(),
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
            'Enter your email and password to get your account registered your account',
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
