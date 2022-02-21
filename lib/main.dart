import 'package:flutter/material.dart';
import 'package:najme/database/temp.dart';
import 'package:najme/screens/browsing/units_screen.dart';
import 'package:najme/screens/main/loading_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:najme/data.dart';

import 'constants/assets.dart';
import 'database/models.dart';


class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: FutureBuilder(
        future: init(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return snapshot.hasData
            ? UnitsScreen(
              subject: Subject(id: 2, category: "حساب", icon: Assets.mathSymbol, level: 1),
            )
            : CircularProgressIndicator();
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

  runApp(const NajmeApp());
}
