class LoginRequest {
  String _identity;
  String _password;
  String _returnUrl;

  LoginRequest({String identity, String password, String returnUrl}) {
    this._identity = identity;
    this._password = password;
    this._returnUrl = returnUrl;
  }

  String get identity => _identity;
  set identity(String identity) => _identity = identity;
  String get password => _password;
  set password(String password) => _password = password;
  String get returnUrl => _returnUrl;
  set returnUrl(String returnUrl) => _returnUrl = returnUrl;

  LoginRequest.fromJson(Map<String, dynamic> json) {
    _identity = json['identity'];
    _password = json['password'];
    _returnUrl = json['returnUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identity'] = this._identity;
    data['password'] = this._password;
    data['returnUrl'] = this._returnUrl;
    return data;
  }
}