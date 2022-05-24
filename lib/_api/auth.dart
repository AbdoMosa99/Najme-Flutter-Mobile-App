import 'dart:math';
import '../database/models.dart';

Random random = new Random();

Future<String> register_email_api(String email) async {
  
  return '123456';
}

Future<bool> verify_email_api(String email, String code) async {
  
  return true;
}

Future<String> register_password_api(String email, String password) async {
  
  return "ckiAZPwj.S1LXsI6P3azdct57sYaB9FaR0Cbick4G";
}

Future<String> login_api(String username, String password) async {
  
  return "ckiAZPwj.S1LXsI6P3azdct57sYaB9FaR0Cbick4G";
}

Future<Profile> create_profile_api(String token, Profile profile) async {
  
  return Profile(
    id: 1, 
    name: profile.name, 
    gender: profile.gender, 
    birthdate: profile.birthdate, 
    level: profile.level, 
    city: profile.city, 
    ambition: profile.ambition
  );
}

Future<List<Profile>> get_profiles_api(String token) async {
  
  return [
    Profile(
    id: 1, 
    name: 'Omar', 
    gender: 'male', 
    birthdate: DateTime.utc(2005, 11, 9),
    level: 'KG 1', 
    city: 'cairo', 
    ambition: 'Doctor'
    ), 
    Profile(
      id: 2,
      name: 'Rana', 
      gender: 'female', 
      birthdate: DateTime.utc(1007, 2, 15), 
      level: 'KG 2', 
      city: 'Suez', 
      ambition: 'Engineer'
    )
  ];
}
