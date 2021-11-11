import 'package:flutter/material.dart';
import 'package:najme/screens/primary_screens/home_screen.dart';
<<<<<<< HEAD
import 'package:najme/screens/registeration_screens/registeration_1.dart';
import 'package:najme/screens/registeration_screens/registeration_2.dart';
import 'package:najme/screens/registeration_screens/registration_date.dart';
import 'package:najme/screens/registeration_screens/registration_level.dart';
=======
import 'package:najme/screens/primary_screens/login_screen.dart';
import 'package:najme/screens/registeration_screens/registration_date.dart';
import 'package:najme/screens/registeration_screens/registration_level.dart';
import 'package:najme/screens/registeration_screens/gender_screen.dart';
>>>>>>> 37d88a82fd527555a745c1c2d0bfccf4482f3846

class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
<<<<<<< HEAD
      home:Registration_2(),
=======
      home: RegistrationBirthDate(),
>>>>>>> 37d88a82fd527555a745c1c2d0bfccf4482f3846
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const NajmeApp());
}
