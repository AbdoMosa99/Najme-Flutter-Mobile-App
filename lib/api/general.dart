import 'base.dart';

Future<List> cities_api() 
async {
  String url = BASE_URL + 'cities/';
  Map response = await get_api(url);

  List cities = response['result'];

  return cities.map((e) => e['name']).toList();
}

Future<List> levels_api() async {
  String url = BASE_URL + 'levels/';
  Map response = await get_api(url);

  List levels = response['result'];

  return levels.map((e) => e['name']).toList();
}



