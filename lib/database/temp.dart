import 'package:najme/constants/assets.dart';
import 'init.dart';
import 'models.dart';


Future<void> insertData() async {

  final database = NajmeDatabase();
  await database.open();

  Profile profile1 = Profile(
      id: 1,
      name: 'Sayed Omar',
      gender: 'ولد',
      birthdate:  DateTime.utc(2015, 11, 9),
      level: 'KG1',
      city: 'السويس',
      ambition: 'طبيب'
  );
  await database.insertProfile(profile1);

  Profile profile2 = Profile(
      id: 2,
      name: 'Salma Omar',
      gender: 'بنت',
      birthdate:  DateTime.utc(2015, 11, 9),
      level: 'KG1',
      city: 'اسكندرية',
      ambition: 'طبيب'
  );
  await database.insertProfile(profile2);


  String kg1 = 'KG1';
  await database.insertLevel(kg1);

  String kg2 = 'KG2';
  await database.insertLevel(kg2);

  Subject arabic = Subject(
      id: 1,
      category: 'لغة عربية',
      icon: Assets.arabicSymbol,
      level: 'KG1'
  );
  await database.insertSubject(arabic);

  Subject math = Subject(
      id: 2,
      category: 'حساب',
      icon: Assets.mathSymbol,
      level: 'KG1'
  );
  await database.insertSubject(math);

  Subject english = Subject(
      id: 3,
      category: 'English',
      icon: Assets.englishSymbol,
      level: 'KG1'
  );
  await database.insertSubject(english);

  Subject iq = Subject(
      id: 4,
      category: 'ذكاء',
      icon: Assets.iqSymbol,
      level: 'KG1'
  );
  await database.insertSubject(iq);

  Progress progress = Progress(
      id: 1,
      stars: 0,
      fruits: 0,
      excellences: 0,
      subjectId: 2,
      profileId: 1,
      currentUnit: 3,
      currentLesson: 1
  );
  await database.insertProgress(progress);

  Unit unit1 = Unit(id: 1, number: 1, name: "الوحدة الأولى", icon: Assets.falsePic, subjectID: 2);
  Unit unit2 = Unit(id: 2, number: 2, name: "الوحدة الثانية", icon: Assets.falsePic, subjectID: 2);
  Unit unit3 = Unit(id: 3, number: 3, name: "الوحدة الثالثة", icon: Assets.falsePic, subjectID: 2);
  Unit unit4 = Unit(id: 4, number: 4, name: "الوحدة الرابعة", icon: Assets.falsePic, subjectID: 2);
  Unit unit5 = Unit(id: 5, number: 5, name: "الوحدة الخامسة", icon: Assets.falsePic, subjectID: 2);
  Unit unit6 = Unit(id: 6, number: 6, name: "الوحدة السادسة", icon: Assets.falsePic, subjectID: 2);
  Unit unit7 = Unit(id: 7, number: 7, name: "الوحدة السابعة", icon: Assets.falsePic, subjectID: 2);
  Unit unit8 = Unit(id: 8, number: 8, name: "الوحدة الثامنة", icon: Assets.falsePic, subjectID: 2);
  Unit unit9 = Unit(id: 9, number: 9, name: "الوحدة التاسعة", icon: Assets.falsePic, subjectID: 2);

  await database.insertUnit(unit1);
  await database.insertUnit(unit2);
  await database.insertUnit(unit3);
  await database.insertUnit(unit4);
  await database.insertUnit(unit5);
  await database.insertUnit(unit6);
  await database.insertUnit(unit7);
  await database.insertUnit(unit8);
  await database.insertUnit(unit9);

}
