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
      currentUnit: 1,
      currentLesson: 1
  );
  await database.insertProgress(progress);


}

Future<void> getData() async{
  final database = NajmeDatabase();
  await database.init();

  database.getProfile(1).then((value) {
    print(value.toString());
  }).catchError((error){
    print('error ${error.toString()}');
  });
}


