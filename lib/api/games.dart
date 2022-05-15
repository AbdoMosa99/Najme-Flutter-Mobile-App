import 'base.dart';

Future<List> games_api(String token, int lessonID) async {
  String url = BASE_URL + 'games/$lessonID';
  Map<String, String> headers = {
    "X-Api-Key": API_KEY,
    "Authorization": "Token ${token}",
  };
  Map response = await get_api(url, headers: headers);

  List games = response['result'];

  return games.map((e) => e['name']).toList(); // not finished by abdallah
}
