import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/buttons/gender_button.dart';
import 'package:najme/components/buttons/right_end_button.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/text/registration_question.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration_screens/registration_job.dart';

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
            height: 200.0,
            margin: const EdgeInsets.only(top: 80.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                  const SizedBox(width: 20.0),
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
              margin: const EdgeInsets.only(top: 30.0),
              child: Order(
                question: "اختر نوعك!",
                size: 50.0,
              )),
        ],
      ),
      floutingButton: RightEndButton(
        whenTap: () {
          Navigator.push(
              context, LeftRightPageRoute(const RegistrationJob(), 1, 0));
        },
      ),
    );
  }
}
