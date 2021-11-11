import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najme/components/buttons/choise_button_text.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/containers/main_registration_image.dart';
import 'package:najme/components/text/registration_question.dart';
import 'package:najme/components/buttons/right_end_button.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
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
    // component for the screen background image
    return mainContainer(
      //appBar: true,
        child:Column(
          children: [
            // Component to put image in screen
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
                          }
                        );
                      },
                      // action when user click on image, color change
                    color: level == 1?     AppColors.primary:  AppColors.surface,
                    textColor: level == 1?   AppColors.white :  AppColors.primary,
                  ),
                  choiseButtonText(
                      text: "KG2",
                      whenTap:(){
                        setState(() {
                          level = 2;
                          }
                        );
                      },
                      color: level == 2?     AppColors.primary:  AppColors.surface,
                      textColor: level == 2?   AppColors.white :  AppColors.primary,
                  ),
                ],
              ),
            ),
            order(question: "!اختر مرحلتك"),
            rightEndButton(),
             ],
            ),
         );
    }
  }