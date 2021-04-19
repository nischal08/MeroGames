import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:merogames/controller/login-controller.dart';
import 'package:merogames/models/LoginResponse.dart';
import 'package:merogames/test/api_end_point.dart';
import 'package:merogames/widgets/custom-textfield.dart';
import 'package:merogames/widgets/general-elevated-button.dart';
import 'package:provider/provider.dart';

Future<String> loginUserFormScreen({String identity, String password}) async {
 LoginResponse response=await ApiEndPoint().userLogin(identity: identity, password: password);
  // .then((value) {
  //   debugPrint("this is response value ${value.sessionToken}");
  // });
  return response.sessionToken;

  // print(identity + password);
  //
  //
  // var user = {
  //   "identity": identity,
  //   "password": password,
  //   "returnUrl": "string",
  // };
  // var client = http.Client();

  // print(user);
  // // LoginRequest request = LoginRequest(identity: identity,password: password,);
  // http.Response response = await client.post(
  //     Uri.parse('https://games.demo-4u.net/Account/Login'),
  //     body: user,
  //     );

  // print(response.body);
  // print(response.request);
  // return "";
  // Map<String, dynamic> decodedResponse = json.decode(response.body);
  // print(decodedResponse["sessionToken"].toString());
  // print(decodedResponse["sessionToken"].toString());

  // print("Success");
  // final String responseString = response.body;
  // return loginResponseFromJson(responseString);
}

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
        child: _loginStateController.showProgressBar
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
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
                      CustomTextField(
                        controller: _emailController,
                        label: 'Enter Email',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
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
          onPressed: () async {
          var sessionToken= await  loginUserFormScreen(
                identity: _emailController.text,
                password: _passwordController.text);



  _loginStateController.onClickSaveBtn(
                sessionToken: sessionToken,
              );
            // LoginResponse user = await loginUser(
            //     identity: _emailController.text,
            //     password: _passwordController.text);
            // print(user.sessionToken);
            // print(_emailController.text);
            // print(_passwordController.text);

            //  await  _loginStateController.onClickSaveBtn(
            //     context: context,
            //     identity: _emailController.text,
            //     password: _passwordController.text,
            //   );
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
