import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String _token = '';
  bool _successLogin = false;

  late Future<SharedPreferences> _prefs;

  static AuthService? _this;

  factory AuthService() {
    _this ??= AuthService._();
    return _this!;
  }

  AuthService._() {
    _prefs = SharedPreferences.getInstance();
  }

  String get token => _token;

  bool get successLogin => _successLogin;

  void clearAuth() {
    _token = '';
    _successLogin = false;
    _prefs.then((prf) {
      prf.setString('token', '');
    });
  }

  void setToken(String newToken) async {
    _token = newToken;
    _prefs.then((p) {
      p.setString('token', _token);
    });
  }

  Future<bool> getDataFromPrfs() {
    return _prefs.then((p) async {
      _token = p.getString('token') ?? "";
      if (_token.isEmpty) {
        return false;
      } else {
        return true;
      }
    });
  }

  void setLoginStatus(bool v) {
    _successLogin = v;
    _prefs.then((value) {
      value.setBool("loginStatus", v);
    });
  }

  Future<bool> getLoginStatus() {
    return _prefs.then((value) async {
      _successLogin = value.getBool("loginStatus") ?? false;
      if (_successLogin == false) {
        return false;
      } else {
        return true;
      }
    });
  }
}
