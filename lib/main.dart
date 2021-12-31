import 'package:flutter/material.dart';
import 'package:najme/screens/primary_screens/children_profiles.dart';
import 'package:najme/screens/primary_screens/contactus_screen.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';



class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContactUsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const NajmeApp());
}
