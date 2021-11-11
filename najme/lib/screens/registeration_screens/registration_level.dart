import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najme/components/choise_button_text.dart';
import 'package:najme/components/main_container.dart';
import 'package:najme/components/main_registration_image.dart';
import 'package:najme/components/registration_question.dart';
import 'package:najme/components/right_end_button.dart';
import 'package:najme/constants/assets.dart';



class RegistrationLevelScreen extends StatelessWidget {
  const RegistrationLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegistrationLevel(),
      debugShowCheckedModeBanner: false,
    );
  }
}



class RegistrationLevel extends StatefulWidget {
  const RegistrationLevel({Key? key}) : super(key: key);


  @override
  _RegistrationLevelState createState() => _RegistrationLevelState();
}

class _RegistrationLevelState extends State<RegistrationLevel> {
  var level = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainContainer(
        child:Column(
          children: [

            mainImage(image: Assets.nextLevel),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  choiseButtonText(
                      text: "KG1",
                      whenTap:(){
                        setState(() {
                          level = 1;
                        });
                      },
                      color: level == 1?   Color(0xff311B92): Color(0xFFDED5EF),
                      textColor: level == 1?  Color(0xffffffff) : Color(0xff311B92)
                  ),


                  choiseButtonText(
                      text: "KG2",
                      whenTap:(){
                        setState(() {
                          level = 2;
                        });
                      },
                      color: level == 2?   Color(0xff311B92): Color(0xFFDED5EF),
                      textColor: level == 2?  Color(0xffffffff) : Color(0xff311B92)
                  ),

                ],
              ),
            ),


            order(question: "!اختر مرحلتك"),

            rightEndButton(),
          ],
        ),
      ),
    );

  }
}