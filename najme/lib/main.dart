import 'package:flutter/material.dart';
import 'package:najme/screens/primary_screens/home_screen.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';
import 'package:najme/screens/registeration_screens/gender_screen.dart';
import 'package:najme/screens/registeration_screens/registeration_email.dart';
import 'package:najme/screens/registeration_screens/registeration_name.dart';
import 'package:najme/screens/registeration_screens/registration_date.dart';
import 'package:najme/screens/registeration_screens/registration_job.dart';
import 'package:najme/screens/registeration_screens/registration_level.dart';


class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegistrationName(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const NajmeApp());
}
