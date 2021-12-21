import 'package:flutter/material.dart';
import 'package:najme/screens/levels/choosing_theme.dart';
import 'package:najme/screens/levels/listening_theme.dart';
import 'package:najme/screens/levels/order_game.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';
import 'package:najme/screens/registeration_screens/registration_password.dart';


class NajmeApp extends StatelessWidget {
  const NajmeApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegistrationPassword(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const NajmeApp());
}
