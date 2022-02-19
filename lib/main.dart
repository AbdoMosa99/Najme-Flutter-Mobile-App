import 'package:flutter/material.dart';
import 'package:najme/screens/drawer/personal_profile_updates.dart';
import 'package:najme/screens/main/launch_screen.dart';
import 'package:najme/database/init.dart';



class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final database = Database();
    database.init();

    return  MaterialApp(//const
      home: PersonalProfileUpdates(), //LaunchScreen
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const NajmeApp());
}
