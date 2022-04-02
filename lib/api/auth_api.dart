import 'dart:convert';
import 'package:http/http.dart';

// import 'package:najme/database/models.dart';

const String API_KEY = "Dz1XfjXu.kLFotO1ReezNeO5xEASHocBfescqIC10";

// HELPERS
Future<Map> post_api(
    String url,  
    Map<String, dynamic> body, 
    {Map<String, String> headers = const {"X-Api-Key": API_KEY}}
    ) async {

  Uri uri = Uri.parse(url);

  Response response = await post(uri, headers: headers, body: body);
  assert(response.statusCode == 200);

  Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}

// REGISTRATION

Future<String> register_email_api(String email) async {
  String url = 'http://3.70.95.100/api/accounts/send_otp/';
  Map<String, dynamic> body = {"email": email};

  Map response = await post_api(url, body);

  return response['result']['OTP'];
}


Future<bool> verify_email_api(String email, String code) async {
  String url = 'http://3.70.95.100/api/accounts/verify_email/';
  Map<String, dynamic> body = {
    "email": email,
    "OTP": code
  };

  Map response = await post_api(url, body);

  return true;
}


Future<String> register_password_api(String email, String password) async {
  String url = 'http://3.70.95.100/api/accounts/register/';
  Map<String, dynamic> body = {
    "email": email,
    "password": password
  };

  Map response = await post_api(url, body);

  return response['result']['token'];
}

// Future<Profile> create_profile_api(String token, Profile profile) async {
//   throw Exception();
// } 


// LOGIN


// INITIAL DATA

void main() async {
  String email = "mosa2@gmail.com";
  String password = "123456879";

  String code = await register_email_api(email);
  print("Returned code: $code");

  bool verified = await verify_email_api(email, code);
  print("Verified: $verified");

  String token = await register_password_api(email, password);
  print("Returned token: $token");
}
