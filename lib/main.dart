import 'package:flutter/material.dart';
import 'package:najme/database/temp.dart';
import 'package:najme/screens/browsing/units_screen.dart';
import 'package:najme/screens/drawer/personal_profile_updates.dart';
import 'package:najme/database/init.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:najme/data.dart';



class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: UnitsScreen(
        text: "حساب",
        subjectID: 2,
      ), 
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await deleteDatabase(join(await getDatabasesPath(), 'najme.db'));
  await database.init();
  await insertData();

  runApp(const NajmeApp());
}
