import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/buttons/main_floating_button.dart';
import 'package:najme/components/containers/job_container.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/text/registration_question.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';
import 'package:najme/utility.dart';

class RegistrationJob extends StatefulWidget {
  const RegistrationJob({Key? key}) : super(key: key);
  @override
  _Registration_6 createState() => _Registration_6();
}

class _Registration_6 extends State<RegistrationJob> {
  int job = -1;
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(
                    horizontal: adjustValue(context, 10.0), 
                    vertical: adjustValue(context, 0.0)
                    ),
              child: Row(
                children: [
                  JobContainer(
                    whenTap: () {
                      setState(() {
                        job = 1;
                      });
                    },
                    image: Assets.teacher,
                    height: adjustValue(context, 142),
                    width: adjustValue(context, 115),
                    text: 'مدرس',
                    color: job == 1 ? AppColors.primary : AppColors.surface,
                    textColor: job == 1 ? AppColors.white : AppColors.primary,
                  ),
                  SizedBox(
                    width: adjustValue(context, 20),
                  ),
                  JobContainer(
                    whenTap: () {
                      setState(() {
                        job = 2;
                      });
                    },
                    image: Assets.engineer,
                    height: adjustValue(context, 142),
                    width: adjustValue(context, 115),
                    text: 'مهندس',
                    color: job == 2 ? AppColors.primary : AppColors.surface,
                    textColor: job == 2 ? AppColors.white : AppColors.primary,
                  ),
                  SizedBox(
                    width: adjustValue(context, 20),
                  ),
                  JobContainer(
                    whenTap: () {
                      setState(() {
                        job = 3;
                      });
                    },
                    image: Assets.policeman,
                    height: adjustValue(context, 142),
                    width: adjustValue(context, 115),
                    text: 'ضابط',
                    color: job == 3 ? AppColors.primary : AppColors.surface,
                    textColor: job == 3 ? AppColors.white : AppColors.primary,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: adjustValue(context, 30),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(
                    horizontal: adjustValue(context, 10.0), 
                    vertical: adjustValue(context, 0.0)
                    ),
              child: Row(
                children: [
                  JobContainer(
                    whenTap: () {
                      setState(() {
                        job = 4;
                      });
                    },
                    image: Assets.doctor,
                    height: adjustValue(context, 142),
                    width: adjustValue(context, 115),
                    text: 'طبيب',
                    color: job == 4 ? AppColors.primary : AppColors.surface,
                    textColor: job == 4 ? AppColors.white : AppColors.primary,
                  ),
                  SizedBox(
                    width: adjustValue(context, 20),
                  ),
                  JobContainer(
                    whenTap: () {
                      setState(() {
                        job = 5;
                      });
                    },
                    image: Assets.programmer,
                    height: adjustValue(context, 142),
                    width: adjustValue(context, 115),
                    text: 'مبرمج',
                    color: job == 5 ? AppColors.primary : AppColors.surface,
                    textColor: job == 5 ? AppColors.white : AppColors.primary,
                  ),
                  SizedBox(
                    width: adjustValue(context, 20),
                  ),
                  JobContainer(
                    whenTap: () {
                      setState(() {
                        job = 6;
                      });
                    },
                    image: Assets.scientist,
                    height: adjustValue(context, 142),
                    width: adjustValue(context, 115),
                    text: 'عالم',
                    color: job == 6 ? AppColors.primary : AppColors.surface,
                    textColor: job == 6 ? AppColors.white : AppColors.primary,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: adjustValue(context, 30),
            ),
            Order(
              question: "ماذا تريد أن تكون عندما تكبر!",
              size: adjustValue(context, 50.0),
              maxlines: 3,
            ),
          ],
        ),
      ),
      floutingButton: MainFloatingButton(
        onTap: () {
          Navigator.push(
              context, LeftRightPageRoute(const LoginScreen(), 1, 0));
        },
      ),
    );
  }
}
