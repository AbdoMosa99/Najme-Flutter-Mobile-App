import 'package:flutter/material.dart';
import 'package:najme/screens/primary_screens/home_screen.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';
import 'package:najme/screens/registeration_screens/gender_screen.dart';
import 'package:najme/screens/registeration_screens/registeration_2.dart';

import 'screens/registeration_screens/registeration_1.dart';
import 'screens/registeration_screens/registration_6.dart';
import 'screens/registeration_screens/registration_level.dart';


class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Registration_6(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const NajmeApp());
}
