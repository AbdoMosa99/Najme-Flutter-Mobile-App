import 'package:najme/database/init.dart';
import 'package:najme/database/models.dart';
import 'package:najme/dialogs/settings_dialog/settings_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

final NajmeDatabase database = NajmeDatabase();
late SharedPreferences prefs;

late Profile profile;
late List<Progress> progresses;
late List<Subject> subjects;
late String level;
late String token;
late bool isLoggedIn;

late Settings settings;
late double rating;


final List<String> gendersList = [
  'ولد', 
  'بنت'
];

final List<int> daysList = [for (int i = 1; i <= 31; i++) i];
final List<String> monthsList = [
  "يناير", 
  "فبراير", 
  "مارس", 
  "إبريل",
  "مايو", 
  "يونيو", 
  "يوليو", 
  "أغسطس", 
  "سبتمبر",
  "أكتوبر", 
  "نوفمبر", 
  "ديسمبر",
];
int current_year = DateTime.now().year;
final List<int> yearsList = [for (int i = 3; i <= 15; i++) current_year - i ];
final List<String> countriesList = [
  "القاهرة",
  "الجيزة", 
  "الشرقية", 
  "الدقهلية", 
  "البحيرة",
  "المنيا", 
  "القليوبية", 
  "الإسكندرية", 
  "الغربية",
  "سوهاج", 
  "أسيوط", 
  "المنوفية", 
  "كفر الشيخ", 
  "الفيوم", 
  "قنا",
  "بني سويف", 
  "أسوان", 
  "دمياط",
  "الإسماعيلية", 
  "الأقصر", 
  "بور سعيد", 
  "السويس",
  "مطروح", 
  "شمال سيناء", 
  "البحر الاحمر", 
  "الوادي الجديد", 
  "جنوب سيناء",
];
final List<String> futureList = [
  'مدرس',
  'مهندس',
  'ضابط',
  'طبيب',
  'مبرمج',
];
final List<String> levelsList = [
  'KG1',
  'KG2'
];
final List<String> FilterLevelList = ['الكل', 'KG1', 'KG2',];
final List<String> FilterSemList = [
  'الأول',
  'الثاني',
];
final List<String> FilterSubjectList = [
  'لغة عربية',
  'حساب',
  'لغة انجليزية',
  'ذكاء',
];

Future<bool> init() async {
  await database.open();
  prefs = await SharedPreferences.getInstance();
  bool? loggedIn = prefs.getBool("isLoggedIn");

  if (loggedIn == null){
    prefs.setDouble('rating', 0.0);
    rating = 0.0;

    settings = Settings();
    prefs.setBool('bg_music', settings.bgMusic);
    prefs.setBool('sounds', settings.sounds);
    prefs.setBool('notifications', settings.notifications);
    prefs.setBool('vibration', settings.vibration);

    prefs.setBool("isLoggedIn", false);
    loggedIn = false;
  }
  isLoggedIn = loggedIn;

  if (isLoggedIn){
    token = prefs.getString('token')!;
    int profileID = prefs.getInt('profile_id')!;
    profile = await database.getProfile(profileID);
    progresses = await database.getProgress(profileID);
    subjects = await database.getSubjects(profileID);
    settings = Settings(
      bgMusic: await prefs.getBool('bg_music')?? true,
      sounds: await prefs.getBool('sounds')?? true,
      notifications: await prefs.getBool('notifications')?? true,
      vibration: await prefs.getBool('vibration')?? false,
    );
    rating = await prefs.getDouble('rating')!;
  }

  return true;
}
