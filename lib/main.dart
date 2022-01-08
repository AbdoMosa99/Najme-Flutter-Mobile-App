import 'package:flutter/material.dart';
import 'package:najme/screens/primary_screens/home_screen.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';
import 'package:najme/screens/space/categories.dart';


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