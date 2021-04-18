import 'package:http/http.dart' as http;
import 'package:merogames/models/LoginResponse.dart';

class AuthService {
  static var baseUrl = 'https://games.demo-4u.net/swagger';
 static Future<dynamic> register({
    String fname,
    String lname,
    int phoneNumber,
    String password,
  }) async {
    try {
      var response = await http.post(
        Uri.http(baseUrl, '/Account/Register'),
        body: {
          "role": 0,
          "firstName": fname,
          "lastName": lname,
          "phoneNumber": phoneNumber,
          "termsOfService": true,
          "password": password,
          "confirmPassword": password,
          // "referrer": "string"
        },
      );

      return response.body;
    } catch (e) {
      print(e);
    }
  }

  static Future<LoginResponse> loginUser(
      {String identity, String password}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/Account/Login'),
        body: {
          "identity": identity,
          "password": password,
          "returnUrl": "string"
        },
      );

      if (response.statusCode == 200) {
        print("Success");
        final String responseString = response.body;
        return loginResponseFromJson(responseString);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
