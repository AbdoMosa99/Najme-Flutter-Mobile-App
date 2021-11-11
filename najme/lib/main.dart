import 'package:flutter/material.dart';
import 'package:najme/screens/home_screen.dart';
import 'package:najme/screens/login_screen.dart';
// import 'package:najme/screens/home_screen.dart';
// import 'package:najme/screens/login_screen.dart';
//import 'package:najme/screens/registeration_pages/registeration_name.dart';
// import 'package:najme/screens/test.dart';
// import 'screens/registeration_pages/registration_date.dart';

class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const NajmeApp());
}
