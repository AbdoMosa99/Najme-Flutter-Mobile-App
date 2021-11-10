import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najme/components/choise_button_text.dart';
import 'package:najme/components/main_container.dart';
import 'package:najme/components/main_registration_image.dart';
import 'package:najme/components/registration_question.dart';
import 'package:najme/components/right_end_button.dart';


class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var level = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainContainer(
        bgImage: "images/BG.jpg",

        child:Column(
          children: [

            mainImage(image: "images/next-level.png"),

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