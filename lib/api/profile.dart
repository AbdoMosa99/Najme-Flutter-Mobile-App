import 'package:najme/database/models.dart';

import 'base.dart';

Future<List<Subject>> subjects_api(String token, int profileID) async {
  String url = BASE_URL + 'subjects/$profileID';
  Map<String, String> headers = {
    "X-Api-Key": API_KEY,
    "Authorization": "Token ${token}",
  };
  Map response = await get_api(url, headers: headers);

  List subjects = response['result'];

  return subjects.map((e) => Subject.fromMap(e)).toList(); // not finished by abdallah
}

Future<List<Unit>> units_api(String token, int subjectID) async {
  String url = BASE_URL + 'units/$subjectID';
  Map<String, String> headers = {
    "X-Api-Key": API_KEY,
    "Authorization": "Token ${token}",
  };
  Map response = await get_api(url, headers: headers);

  List units = response['result'];


  return units.map((e) => Unit.fromMap(e)).toList(); // not finished by abdallah
}

Future<List<Lesson>> lessons_api(String token, int unitID) async {
  String url = BASE_URL + 'lessons/$unitID';
  Map<String, String> headers = {
    "X-Api-Key": API_KEY,
    "Authorization": "Token ${token}",
  };
  Map response = await get_api(url, headers: headers);

  List lessons = response['result'];

  return lessons.map((e) => Lesson.fromMap(e)).toList(); // not finished by abdallah
}


