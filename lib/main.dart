import 'package:flutter/material.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';
import 'package:najme/screens/primary_screens/personal_account_updates.dart';


class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PersonalAccountUpdates(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const NajmeApp());
}