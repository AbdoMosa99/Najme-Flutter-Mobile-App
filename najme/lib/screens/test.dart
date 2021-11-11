import 'package:flutter/material.dart';
import 'package:najme/components/background_image.dart';
import 'package:najme/components/home_container.dart';
import 'package:najme/components/nav_bar.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class Test extends StatefulWidget {
  const Test({ Key? key }) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(null, Container())
    );
  }
}