import '../database/models.dart';
import 'dart:math';


Random random = new Random();


Future<List<Subject>> subjects_api(String token, int profileID) async {
  return [
    Subject(
      id: 1, 
      category: "لغة عربية",
      icon: "assets/icons/arabic_symbol.svg", 
      level: 'KG1,'
    ),
    Subject(
      id: 2,
      category: "حساب",
      icon: "assets/icons/math_symbol.svg",
      level: 'KG1,'
    ),
    Subject(
      id: 3,
      category: "English", 
      icon: "assets/icons/english_symbol.svg", 
      level: 'KG1',
    ),
    Subject(
      id: 4,
      category: "ذكاء",
      icon: "assets/icons/iq_symbol.svg",
      level: 'KG1',
    ),
  ];
}


Future<List<Unit>> units_api(String token, int subjectID) async {
  List<Unit> units = [];
  for (int i = 1; i <= 15; i++) {
    units.add(
      Unit(
        id: 15 * subjectID + i,
        number: i,
        name: "الوحدة $i",
        icon: "assets/icons/two.svg",
        subjectID: subjectID,
      ),
    );
  }
  return units;
}


Future<List<Lesson>> lessons_api(String token, int unitID) async {
  List<Lesson> lessons = [];
  for (int i = 1; i <= 30; i++) {
    lessons.add(
      Lesson(
        id: 30 * unitID + i,
        number: i,
        name: "الدرس $i",
        unitID: unitID,
      ),
    );
  }
  return lessons;
}

Future<List<Progress>> progress_api(String token, int profileID) async {
  List<Progress> progresses = [];
  for (int i = 1; i <= 4; i++) {
    progresses.add(
      Progress(
        id: random.nextInt(1000),
        stars: 21 + i,
        fruits: 13 + i,
        excellences: 7 + i,
        profileId: profileID,
        subjectId: i,
        currentUnit: 3 + i,
        currentLesson: 7 + i,
      )
    );
  }
  return progresses;
}
