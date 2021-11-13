import 'package:flutter/material.dart';
import 'package:najme/components/buttons/right_end_button.dart';
import 'package:najme/components/containers/job_container.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/text/registration_question.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';

class RegistrationJob extends StatefulWidget {
  const RegistrationJob({Key? key}) : super(key: key);
  @override
  _Registration_6 createState() => _Registration_6();
}
class _Registration_6 extends State<RegistrationJob> {
  int job = -1;
  @override
  Widget build(BuildContext context) {
    return mainContainer(
        child: SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                      child: Row(
                        children: [
                          JobContainer (
                            whenTap: (){
                              setState(() {
                                job = 1;
                              });
                            },
                            image: Assets.teacher,
                            text: 'مدرس',
                            color: job == 1?     AppColors.primary:  AppColors.surface,
                            textColor: job == 1?   AppColors.white :  AppColors.primary,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          JobContainer (
                            whenTap: (){
                              setState(() {
                                job = 2;
                              });
                            },
                            image: Assets.engineer,
                            text: 'مهندس',
                            color: job == 2?     AppColors.primary:  AppColors.surface,
                            textColor: job == 2?   AppColors.white :  AppColors.primary,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          JobContainer (
                            whenTap: (){
                              setState(() {
                                job = 3;
                              });
                            },
                            image: Assets.policeman,
                            text: 'ضابط',
                            color: job == 3?     AppColors.primary:  AppColors.surface,
                            textColor: job == 3?   AppColors.white :  AppColors.primary,
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(
                    height: 30,
                  ),

                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                    child: Row(
                      children: [
                        JobContainer (
                          whenTap: (){
                            setState(() {
                              job = 4;
                            });
                          },
                          image: Assets.doctor,
                          text: ' دكتور ',
                          color: job == 4?     AppColors.primary:  AppColors.surface,
                          textColor: job == 4?   AppColors.white :  AppColors.primary,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        JobContainer (
                          whenTap: (){
                            setState(() {
                              job = 5;
                            });
                          },
                          image: Assets.programmer,
                          text: 'مبرمج',
                          color: job == 5?     AppColors.primary:  AppColors.surface,
                          textColor: job == 5?   AppColors.white :  AppColors.primary,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        JobContainer (
                          whenTap: (){
                            setState(() {
                              job = 6;
                            });
                          },
                          image: Assets.scientist,
                          text: 'عالم',
                          color: job == 6?     AppColors.primary:  AppColors.surface,
                          textColor: job == 6?   AppColors.white :  AppColors.primary,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  Order(
                    question: "ماذا تريد أن تكون عندما تكبر!",
                    size: 50.0,
                    maxlines: 3,
                  ),

                ]
            ),
          ),
        floutingButton: RightEndButton(
          whenTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginScreen()
              ),
            );
          },
        ),
      );
     }
  }