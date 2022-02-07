import 'package:flutter/material.dart';
import 'package:najme/screens/main/login_screen.dart';
import 'package:najme/database/init.dart';



class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final database = Database();
    database.init();

    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const NajmeApp());
}
