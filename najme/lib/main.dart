import 'package:flutter/material.dart';
import 'package:najme/screens/registeration_screens/gender_screen.dart';
import 'package:najme/screens/registeration_screens/registeration_2.dart';

import 'screens/registeration_screens/registeration_1.dart';
import 'screens/registeration_screens/registration_level.dart';


class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegistrationLevelScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const NajmeApp());
}
