import 'dart:convert';
import 'package:http/http.dart';
import '../database/models.dart';

const String API_KEY = "ckiAZPwj.S1LXsI6P3azdct57sYaB9FaR0Cbick4G";

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


Future<List> get_api(
    String url,
    {Map<String, String> headers = const {"X-Api-Key": API_KEY}}
    ) async {

  Uri uri = Uri.parse(url);

  Response response = await get(uri, headers: headers);
  assert(response.statusCode == 200);

  List decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));

  return decodedResponse;
}


// REGISTRATION

Future<String> register_email_api(String email) async {
  String url = 'http://3.70.239.104/api/accounts/register_email/';
  Map<String, dynamic> body = {"email": email};

  Map response = await post_api(url, body);

  return response['result']['OTP'];
}


Future<bool> verify_email_api(String email, String code) async {
  String url = 'http://3.70.239.104/api/accounts/verify_email/';
  Map<String, dynamic> body = {
    "email": email,
    "OTP": code
  };

  Map response = await post_api(url, body);

  return true;
}


Future<String> register_password_api(String email, String password) async {
  String url = 'http://3.70.239.104/api/accounts/register_password/';
  Map<String, dynamic> body = {
    "email": email,
    "password": password
  };

  Map response = await post_api(url, body);

  return response['result']['token'];
}



Future<Profile> create_profile_api(String token, Profile profile) async {
  String url = 'http://3.70.239.104/api/profiles/create_profile/';
  Map<String, dynamic> body = profile.toMap();
  Map<String, String> headers =  {
                                    "X-Api-Key": API_KEY,
                                    "Authorization": "Token ${token}",
                                  };
  Map response = await post_api(url, body, headers: headers);

  return Profile.fromMap(response['result']);
}


// LOGIN
Future<String> login_api(String username, String password) async {
  String url = 'http://3.70.239.104/api/accounts/login/';
  Map<String, dynamic> body = {
    "username": username,
    "password": password
  };
  Map response = await post_api(url, body);

  if (response['token'] == null){
    return "wrong";
  }
  else{
    return response['token'];
  }
}



Future<List<Profile>> get_profiles_api(String token) async {
  String url = 'http://3.70.239.104/api/profiles/';
  Map<String, String> headers =  {
                                  "X-Api-Key": API_KEY,
                                  "Authorization": "Token ${token}",
                                };
  List response = await get_api(url, headers: headers);
  print(response);

  List<Profile> profiles = [];
  response.forEach( (map_profile) async{
  print(map_profile);
    Profile profile = Profile.fromMap(map_profile);
    print(profile);
        print('ddd');

    profiles.add(profile);
  });
  return profiles;
}


// INITIAL DATA

Future<Progress> get_progress_api(String token, int profileId){
  //TODO
  throw Exception();
}

Future<List<Subject>> get_subjects_api(String token, int profileId){
  //TODO
  throw Exception();
}

Future<List<Unit>> get_units_api(String token, int subjectId){
  //TODO
  throw Exception();
}



void main() async {
  String email = "m17@gmail.com";
  String password = "123456879";

  //String code = await register_email_api(email);
  //print("Returned code: $code");

  //bool verified = await verify_email_api(email, code);
  //print("Verified: $verified");

  //String token = await register_password_api(email, password);
  //print("Returned token: $token");

  //Profile profileus = await create_profile_api(token, Profile(id: 0, name: 'Ali', gender: 'male', birthdate: DateTime.utc(2000, 1, 1), level: 'KG1', city: 'السويس', ambition: 'حرامي'));
  //print(profileus);

  String token2 = await login_api(email, password);
  print(token2);

  List<Profile> profiles = await get_profiles_api(token2);
  print(profiles);

}
