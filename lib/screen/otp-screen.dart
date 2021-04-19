import 'package:flutter/material.dart';
import 'package:merogames/constants/constants.dart';
import 'package:merogames/controller/otp-controller.dart';
import 'package:merogames/widgets/general-elevated-button.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  OtpController _otpController;
  final String number;
  final String userRegisteredId;

  OtpScreen({this.number, this.userRegisteredId});
  @override
  Widget build(BuildContext context) {
    // print(number + "userId" + userRegisteredId);
    _otpController = Provider.of<OtpController>(context);
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              _backBtn(context),
              _otpImage(),
              SizedBox(
                height: 20,
              ),
              _otpInfoAndTextField(context),
            ],
          ),
        ),
      ),
    );
  }

  Column _otpInfoAndTextField(context) {
    return Column(
      children: [
        Text(
          "OTP Verification",
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: colorBlackFont,
              ),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Enter the OTP sent to +977 - ${number}"),
        SizedBox(
          height: 20,
        ),
        _otpTextField(context),
        SizedBox(
          height: 50,
        ),
        GeneralElevatedButton(
          label: "Send OTP",
          onPressed: () {
            _otpController.onClickOtpSend(context);
          },
        )
      ],
    );
  }

  Widget _otpTextField(context) {
    return Container(
     
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: OTPTextField(
        length: 6,
        width: MediaQuery.of(context).size.width,
        fieldWidth: 55,
        style: TextStyle(fontSize: 16),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.underline,
        onCompleted: (pin) {
          _otpController.setOtpAndUserResgisteredId(
      otpCode: pin, userRegisteredId: this.userRegisteredId);
        },
      ),
      ),
    );
  }

  Widget _backBtn(context) {
    return GestureDetector(
      onTap: () {
        _otpController.onCLickBackBtn(context);
      },
      child: CircleAvatar(
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class _otpImage extends StatelessWidget {
  const _otpImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
        "https://img.freepik.com/free-vector/security-otp-one-time-password-smartphone-shield_9904-104.jpg?size=626&ext=jpg");
  }
}
