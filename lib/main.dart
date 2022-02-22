import 'package:flutter/material.dart';
import 'package:najme/database/temp.dart';
import 'package:najme/screens/drawer/children_profiles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:najme/data.dart';

class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: init(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return snapshot.hasData
              ? ChildrenProfiles()
              : Center(child: CircularProgressIndicator());
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await deleteDatabase(join(await getDatabasesPath(), 'najme.db'));
  await insertData();
  // should be moved to registration
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', "123456");
  await prefs.setInt('profile_id', 1);
  await prefs.setString('email', "user@example.com");
  await prefs.setDouble('rating', 3.5);
  await prefs.setBool('sound_is_on', true);

  runApp(const NajmeApp());
}
