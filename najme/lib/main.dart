import 'package:flutter/material.dart';
import 'package:najme/screens/primary_screens/home_screen.dart';
import 'package:najme/screens/registeration_screens/registeration_1.dart';
import 'package:najme/screens/registeration_screens/registeration_2.dart';
import 'package:najme/screens/registeration_screens/registration_date.dart';
import 'package:najme/screens/registeration_screens/registration_level.dart';

class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Registration_2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const NajmeApp());
}
