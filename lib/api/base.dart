import 'dart:convert';
import 'package:http/http.dart';


const String API_KEY = "ckiAZPwj.S1LXsI6P3azdct57sYaB9FaR0Cbick4G";
const String BASE_URL = 'http://3.70.239.104/api/';

// HELPERS AND MAIN FUN
Future<Map> post_api(
  String url,
  Map<String, dynamic> body,
  {Map<String, String> headers = const {"X-Api-Key": API_KEY}}) 

async {
  Uri uri = Uri.parse(url);

  Response response = await post(uri, headers: headers, body: body);
  assert(response.statusCode == 200);

  Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}

Future<Map> get_api(
  String url,
  {Map<String, String> headers = const {"X-Api-Key": API_KEY}}
  ) 
  //headers --> token with amin
  async{
  
  Uri uri = Uri.parse(url);
  Response response = await get(uri, headers: headers);
  assert(response.statusCode == 200);

  Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return decodedResponse;
}

