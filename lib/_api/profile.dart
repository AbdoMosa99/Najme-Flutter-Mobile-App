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
      id: 3,
      category: "English", 
      icon: "assets/icons/english_symbol.svg", 
      level: 'KG1',
    ),
    Subject(
      id: 2,
      category: "حساب",
      icon: "assets/icons/math_symbol.svg",
      level: 'KG1,'
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
  int unitID = 1;
  for (int i = 1; i <= 4; i++) {
    for (int j = 1; j <= 15; j++) {
      units.add(
        Unit(
          id: unitID,
          number: j,
          name: "الوحدة $j",
          icon: "assets/icons/two.svg",
          subjectID: i,
        ),
      );
      unitID++;
    }
  }
  return units;
}

Future<List<Lesson>> lessons_api(String token, int unitID) async {
  
  return [
    Lesson(
    id: random.nextInt(20), 
    number: random.nextInt(20),  
    name: "Lesson 1",
    unitID: random.nextInt(20), 
    ),

    Lesson(
    id: random.nextInt(20), 
    number: random.nextInt(20),  
    name: "Lesson 2",
    unitID: random.nextInt(20), 
    ),
  ];
}

Future<List<Progress>> progress_api(String token, int profileID) async{
  List<Progress> progresses = [];
  for (int i = 1; i <= 4; i++) {
    progresses.add(
      Progress(
        id: i,
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

