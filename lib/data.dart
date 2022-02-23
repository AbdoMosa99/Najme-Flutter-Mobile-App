import 'package:najme/database/init.dart';
import 'package:najme/database/models.dart';
import 'package:shared_preferences/shared_preferences.dart';


final NajmeDatabase database = NajmeDatabase();
late SharedPreferences prefs;

late Profile profile;
late List<Progress> progresses;
late List<Subject> subjects;
late String level;

Future<bool> init() async {
  await database.open();
  prefs = await SharedPreferences.getInstance();

  int profileID = prefs.getInt('profile_id')!;
  profile = await database.getProfile(profileID);
  progresses = await database.getProgress(profileID);
  subjects = await database.getSubjects(profileID);

  return true;
}
