import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/buttons/choice_button_text.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/text/registration_question.dart';
import 'package:najme/components/buttons/main_floating_button.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

import 'gender_screen.dart';

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
    return MainContainer(
      //appBar: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Component to put image in screen
            Padding(
              padding: EdgeInsets.all(adjustValue(context, 30.0)),
              child: Image(
                image: AssetImage(Assets.nextLevel),
                height: adjustValue(context, 116),
                width: adjustValue(context, 116),
              ),
            ),

            SizedBox(
              height: adjustValue(context, 30.0),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                choiceButtonText(
                  text: "KG1",
                  whenTap: () {
                    setState(() {
                      level = 1;
                    });
                  },
                  // action when user click on image, color change
                  color: level == 1 ? AppColors.primary : AppColors.surface,
                  textColor: level == 1 ? AppColors.white : AppColors.primary,
                ),
                
                choiceButtonText(
                  text: "KG2",
                  whenTap: () {
                    setState(() {
                      level = 2;
                    });
                  },
                  color: level == 2 ? AppColors.primary : AppColors.surface,
                  textColor: level == 2 ? AppColors.white : AppColors.primary,
                ),
              ],
            ),

            Order(
              question: "اختر مرحلتك!",
              size: adjustValue(context, 50.0),
            ),

            SizedBox(
              height: adjustValue(context, 35.0),
            ),
          ],
        ),
      ),

      floutingButton: MainFloatingButton(
        onTap: () {
          Navigator.push(
              context, LeftRightPageRoute(const GenderScreen(), 1, 0));
        },
      ),
    );
  }
}
