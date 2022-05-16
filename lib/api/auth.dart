import '../database/models.dart';
import 'base.dart';


Future<String> register_email_api(String email) async {
  String url = BASE_URL + 'accounts/register_email/';
  Map<String, dynamic> body = {"email": email};

  Map response = await post_api(url, body);

  return response['result']['OTP'];
}


Future<bool> verify_email_api(String email, String code) async {
  String url = BASE_URL + 'accounts/verify_email/';
  Map<String, dynamic> body = {
    "email": email,
    "OTP": code
  };

  Map response = await post_api(url, body);

  return true;
}


Future<String> register_password_api(String email, String password) async {
  String url = BASE_URL + 'accounts/register_password/';
  Map<String, dynamic> body = {
    "email": email,
    "password": password
  };

  Map response = await post_api(url, body);

  return response['result']['token'];
}



Future<Profile> create_profile_api(String token, Profile profile) async {
  String url = BASE_URL + 'profiles/create_profile/';
  Map<String, dynamic> body = profile.toMap();
  Map<String, String> headers = {
    "X-Api-Key": API_KEY,
    "Authorization": "Token ${token}",
  };
  Map response = await post_api(url, body, headers: headers);

  return Profile.fromMap(response['result']);
}


// LOGIN
Future<String> login_api(String username, String password) async {
  String url = BASE_URL + 'accounts/login/';
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
  String url = BASE_URL + 'profiles/';
  Map<String, String> headers =  {
                                  "X-Api-Key": API_KEY,
                                  "Authorization": "Token ${token}",
                                };
  Map response = await get_api(url, headers: headers);
  print(response);

  List profiles = response['result'];

  return profiles.map((e) => Profile.fromMap(e)).toList(); // not finished by abdallah

  //List<Profile> profiles = [];
  // response.forEach( (map_profile) async{
  // print(map_profile);
  //   Profile profile = Profile.fromMap(map_profile);
  //   print(profile);
  //       print('ddd');
  //   profiles.add(profile);
  // });
}


// INITIAL DATA

Future<Progress> get_progress_api(String token, int profileId){
  // TODO
  throw Exception();
}




