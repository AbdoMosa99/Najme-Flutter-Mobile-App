import 'package:flutter/material.dart';
import 'package:najme/components/archives/background_image.dart';
import 'package:najme/components/buttons/right_end_button.dart';
import 'package:najme/components/containers/home_container.dart';
import 'package:najme/components/containers/job_container.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/archives/nav_bar.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
class Registration_6 extends StatefulWidget {
  const Registration_6({Key? key}) : super(key: key);
  @override
  _Registration_6 createState() => _Registration_6();
}
class _Registration_6 extends State<Registration_6> {
  int job = -1;
  @override
  Widget build(BuildContext context) {
    return mainContainer(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Center(
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
                              job = 3;
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

                  const Text("ماذا تريد أن تكون ",
                    style: TextStyle(
                        fontFamily: "Cairo",fontSize: 49.0,color:Color(0xFF000063)
                    ),
                  ),

                  const SizedBox(
                    height: 6.0,
                  ),

                  const Text("عندما تكبر!",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontFamily: "Cairo",fontSize: 49.0,color:Color(0xFF000063)
                    ),
                  ),

                  rightEndButton(),
                ]
            ),
          ),
        ),
      );
     }
  }

