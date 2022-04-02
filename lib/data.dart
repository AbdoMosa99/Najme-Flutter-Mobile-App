import 'package:najme/database/init.dart';
import 'package:najme/database/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

final NajmeDatabase database = NajmeDatabase();
late SharedPreferences prefs;

late Profile profile;
late List<Progress> progresses;
late List<Subject> subjects;
late String level;

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
  'مهندس',
  'عالم',
  'مبرمج',
  'ظابط',
  'مدرس',
  'طبيب',
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

  int profileID = prefs.getInt('profile_id')!;
  profile = await database.getProfile(profileID);
  progresses = await database.getProgress(profileID);
  subjects = await database.getSubjects(profileID);

  return true;
}
