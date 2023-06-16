import 'general.dart';
import '../database/models.dart';
import 'auth.dart';
import 'profile.dart';

void main()  {
  general_test();
  registeration_test();
  profile_data_test();
}

void registeration_test() async {
  String email = "m17@gmail.com";
  String password = "123456879";

  String code = await register_email_api(email);
  print("Returned code: $code");

  bool verified = await verify_email_api(email, code);
  print("Verified: $verified");

  String token = await register_password_api(email, password);
  print("Returned token: $token");

  Profile profileus = await create_profile_api(token, Profile(id: 0, name: 'Ali', gender: 'male', birthdate: DateTime.utc(2000, 1, 1), level: 'KG1', city: 'السويس', ambition: 'حرامي'));
  print(profileus);

  String token2 = await login_api(email, password);
  print(token2);

  List<Profile> profiles = await get_profiles_api(token2);
  print(profiles);
}

void general_test() async{
  List cities = await cities_api();
  print (cities);
  List levels = await levels_api();
  print (levels);
}

void profile_data_test() async{
  String email = "m17@gmail.com";
  String password = "123456879";

  String token = await login_api(email, password);

  List subjects = await subjects_api(token, 1);
  print(subjects);

  List units = await units_api(token, 1);
  print(units);

  List lessons = await lessons_api(token, 1);
  print(lessons);

}


