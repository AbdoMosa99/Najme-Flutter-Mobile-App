import 'package:najme/database/init.dart';
import 'package:najme/database/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

final NajmeDatabase database = NajmeDatabase();
late SharedPreferences prefs;

late Profile profile;
late List<Progress> progresses;
late List<Subject> subjects;
late String level;
late String token;
late bool isLoggedIn;


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
  'اخري',
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

  print('a0');


  if (loggedIn == null){
    print('a1');

    prefs.setBool("isLoggedIn", false);
    await prefs.setDouble('rating', 5.0);
    await prefs.setBool('sound_is_on', true);
    loggedIn = false;
      print('a2');

  }

  print('a3');

  isLoggedIn = loggedIn;

  print('a4');

  if (isLoggedIn){
    print('a5');

    token = prefs.getString('token')!;
      print('a6');

    int profileID = prefs.getInt('profile_id')!;
    print(profileID);
    print(profileID == int);

      print('a7');

    profile = await database.getProfile(profileID);
      print('a8');

    progresses = await database.getProgress(profileID);
      print('a9');

    subjects = await database.getSubjects(profileID);
      print('a10');

  }
    print('a11');


  return true;
}
