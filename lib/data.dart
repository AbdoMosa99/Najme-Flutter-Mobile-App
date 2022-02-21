import 'package:najme/database/init.dart';
import 'package:najme/database/models.dart';
import 'package:shared_preferences/shared_preferences.dart';


final NajmeDatabase database = NajmeDatabase();
late SharedPreferences prefs;

late Profile profile;
late List<Progress> progresses;
late List<Subject> subjects;


Future<bool> init() async {
  await database.open();
  prefs = await SharedPreferences.getInstance();

  // should be moved to registration 
  await prefs.setString('token', "123456");
  await prefs.setInt('profile_id', 1);
  await prefs.setString('email', "user@example.com");
  await prefs.setDouble('rating', 3.5);
  await prefs.setBool('sound_is_on', true);

  int profileID = prefs.getInt('profile_id')!;
  profile = await database.getProfile(profileID);
  progresses = await database.getProgress(profileID);
  subjects = await database.getSubjects(profileID);

  return true;
}
