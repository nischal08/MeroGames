import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merogames/api/api_end_point.dart';
import 'package:merogames/models/OtpResponse.dart';
import 'package:merogames/screen/home-screen.dart';

class OtpController extends ChangeNotifier {
  String otp;
  String userRegisteredId;
  String otpResponseMsg;

  Future<String> otpSend() async {
    OtpResponse response = await ApiEndPoint().otpSend(
      otp,
      userRegisteredId,
    );
    return response.message;
  }

  void setOtpAndUserResgisteredId(
      {String otpCode, String userRegisteredId}) async {
    this.otp = otpCode;
    this.userRegisteredId = userRegisteredId;
    notifyListeners();

    // print("id: " + userRegisteredId + "\n" + "otpCode: " + otpCode);
  }

  void onClickOtpSend(BuildContext context) async {
    otpResponseMsg = await otpSend();
    SnackBar(
      content: Text(otpResponseMsg),
    );
    notifyListeners();
    if (otpResponseMsg.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
    print(otpResponseMsg);
  }

  void onCLickBackBtn(BuildContext context) {
    Navigator.of(context).pop();
  }
}
