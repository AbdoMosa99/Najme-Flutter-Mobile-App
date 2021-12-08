import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/buttons/gender_button.dart';
import 'package:najme/components/buttons/main_floating_button.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/text/registration_question.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration_screens/registration_job.dart';
import 'package:najme/utility.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int is_male = -1;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Column(
        children: [
          Container(
            height: adjustValue(context, 200.0),
            margin: EdgeInsets.only(top: adjustValue(context, 80.0)),
            child: Padding(
              padding: EdgeInsets.all(adjustValue(context, 20.0)),
              child: Row(
                children: [
                  GenderButton(
                    whenTap: () {
                      setState(() {
                        is_male = 1;
                      });
                    },
                    image: Assets.male,
                    color: is_male == 1 ? AppColors.primary : AppColors.surface,
                  ),

                  SizedBox(
                    width: adjustValue(context, 20.0)
                  ),

                  GenderButton(
                    whenTap: () {
                      setState(() {
                        is_male = 0;
                      });
                    },
                    image: Assets.female,
                    color: is_male == 0 ? AppColors.primary : AppColors.surface,
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: adjustValue(context, 30.0)),
            child: Order(
              question: "اختر نوعك!",
              size: adjustValue(context, 50.0),
            )
          ),
        ],
      ),

      floutingButton: MainFloatingButton(
        onTap: () {
          Navigator.push(
            context, LeftRightPageRoute(const RegistrationJob(), 1, 0)
          );
        },
      ),
    );
  }
}
