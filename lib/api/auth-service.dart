import 'package:http/http.dart' as http;

class AuthService {
  final baseUrl = 'https://merogamesapi.demo-4u.net';
  Future<dynamic> register({
    String fname,
    String lname,
    int phoneNumber,
    String password,
  }) async {
    try {
      var response = await http.post(
        '$baseUrl/account/register' as Uri,
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

  Future<dynamic> login({
    String identity,
    String password,
  }) async {
    try {
      var response = await http.post(
        '$baseUrl/account/login' as Uri,
        body: {
          "identity": identity,
          "password": password,
          // "returnUrl": "string"
        },
      );

      return response.body;
    } catch (e) {
      print(e);
    }
  }
}
