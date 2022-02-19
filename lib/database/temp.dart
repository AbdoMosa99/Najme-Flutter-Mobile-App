import 'package:najme/constants/assets.dart';
import 'init.dart';
import 'models.dart';


Future<void> insertData() async {

  final database = NajmeDatabase();
  await database.init();

  Profile profile = Profile(
      id: 1,
      name: 'Ahmed',
      gender: 'boy',
      birthdate:  DateTime.utc(1989, 11, 9),
      level: 1,
      city: 'Suez',
      ambition: 'Doctor'
  );
  await database.insertProfile(profile);

  Level kg1 = Level(id: 1, name: 'Kg1');
  await database.insertLevel(kg1);

  Level kg2 = Level(id: 2, name: 'Kg2');
  await database.insertLevel(kg2);

  Subject arabic = Subject(
      id: 1,
      category: 'لغة عربية',
      icon: Assets.arabicSymbol,
      level: 1
  );
  await database.insertSubject(arabic);

  Subject math = Subject(
      id: 2,
      category: 'حساب',
      icon: Assets.mathSymbol,
      level: 1
  );
  await database.insertSubject(math);

  Subject english = Subject(
      id: 3,
      category: 'English',
      icon: Assets.englishSymbol,
      level: 1
  );
  await database.insertSubject(english);

  Subject iq = Subject(
      id: 4,
      category: 'ذكاء',
      icon: Assets.iqSymbol,
      level: 1
  );
  await database.insertSubject(iq);

  Progress progress = Progress(
      id: 1,
      stars: 0,
      fruits: 0,
      excellences: 0,
      subjectId: 1,
      profileId: 1,
      currentUnit: 4,
      currentLesson: 1
  );
  await database.insertProgress(progress);

  Unit unit1 = Unit(id: 1, number: 1, name: "الوحدة الأولى", icon: Assets.mathSymbol, subjectID: 2);
  Unit unit2 = Unit(id: 2, number: 2, name: "الوحدة الأولى", icon: Assets.mathSymbol, subjectID: 2);
  Unit unit3 = Unit(id: 3, number: 3, name: "الوحدة الأولى", icon: Assets.mathSymbol, subjectID: 2);
  Unit unit4 = Unit(id: 4, number: 4, name: "الوحدة الرابعة", icon: Assets.mathSymbol, subjectID: 2);
  Unit unit5 = Unit(id: 5, number: 5, name: "الوحدة الأولى", icon: Assets.mathSymbol, subjectID: 2);
  Unit unit6 = Unit(id: 6, number: 6, name: "الوحدة الأولى", icon: Assets.mathSymbol, subjectID: 2);
  Unit unit7 = Unit(id: 7, number: 7, name: "الوحدة الأولى", icon: Assets.mathSymbol, subjectID: 2);
  Unit unit8 = Unit(id: 8, number: 8, name: "الوحدة الثامنة", icon: Assets.mathSymbol, subjectID: 2);

  await database.insertUnit(unit1);
  await database.insertUnit(unit2);
  await database.insertUnit(unit3);
  await database.insertUnit(unit4);
  await database.insertUnit(unit5);
  await database.insertUnit(unit6);
  await database.insertUnit(unit7);
  await database.insertUnit(unit8);

}

Future<void> getData() async {
  final database = NajmeDatabase();
  await database.init();

  final profile = await database.getProfile(1);
  print(profile.toString());
}


