import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/main_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';
import 'package:najme/screens/registeration_screens/registeration_gender.dart';
import 'package:najme/screens/registeration_screens/registration_level.dart';
import 'package:najme/utility.dart';

class RegistrationJob extends StatefulWidget {
  const RegistrationJob({Key? key}) : super(key: key);
  @override
  _RegistrationJobState createState() => _RegistrationJobState();
}

class _RegistrationJobState extends State<RegistrationJob> {
  int job = -1;
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: adjustHeightValue(context, 40.0),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: adjustHeightValue(context, 152),
                    width: adjustWidthValue(context, 96),
                    child: MainCard(
                      context: context,
                      onTap: () {
                        setState(() {
                          job = 1;
                        });
                      },
                      image: Assets.teacher,
                      text: 'مدرس',
                      color: job == 1 ? AppColors.primary : AppColors.surface,
                      textColor: job == 1 ? AppColors.white : AppColors.primary,
                      fontSize: 20,
                      stroke: true,
                    ),
                  ),

                  Container(
                    height: adjustHeightValue(context, 152),
                    width: adjustWidthValue(context, 96),
                    child: MainCard(
                      context: context,
                      onTap: () {
                        setState(() {
                          job = 2;
                        });
                      },
                      image: Assets.engineer,
                      text: 'مهندس',
                      color: job == 2 ? AppColors.primary : AppColors.surface,
                      textColor: job == 2 ? AppColors.white : AppColors.primary,
                      fontSize: 20,
                      stroke: true,
                    ),
                  ),

                  Container(
                    height: adjustHeightValue(context, 152),
                    width: adjustWidthValue(context, 96),
                    child: MainCard(
                      context: context,
                      onTap: () {
                        setState(() {
                          job = 3;
                        });
                      },
                      image: Assets.policeman,
                      text: 'ضابط',
                      color: job == 3 ? AppColors.primary : AppColors.surface,
                      textColor: job == 3 ? AppColors.white : AppColors.primary,
                      fontSize: 20,
                      stroke: true,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: adjustHeightValue(context, 20.0),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: adjustHeightValue(context, 152),
                    width: adjustWidthValue(context, 96),
                    child: MainCard(
                      context: context,
                      onTap: () {
                        setState(() {
                          job = 4;
                        });
                      },
                      image: Assets.doctor,
                      text: 'طبيب',
                      color: job == 4 ? AppColors.primary : AppColors.surface,
                      textColor: job == 4 ? AppColors.white : AppColors.primary,
                      fontSize: 20,
                      stroke: true,
                    ),
                  ),

                  Container(
                    height: adjustHeightValue(context, 152),
                    width: adjustWidthValue(context, 96),
                    child: MainCard(
                      context: context,
                      onTap: () {
                        setState(() {
                          job = 5;
                        });
                      },
                      image: Assets.programmer,
                      text: 'مبرمج',
                      color: job == 5 ? AppColors.primary : AppColors.surface,
                      textColor: job == 5 ? AppColors.white : AppColors.primary,
                      fontSize: 20,
                      stroke: true,
                    ),
                  ),

                  Container(
                    height: adjustHeightValue(context, 152),
                    width: adjustWidthValue(context, 96),
                    child: MainCard(
                      context: context,
                      onTap: () {
                        setState(() {
                          job = 6;
                        });
                      },
                      image: Assets.scientist,
                      text: 'عالم',
                      color: job == 6 ? AppColors.primary : AppColors.surface,
                      textColor: job == 6 ? AppColors.white : AppColors.primary,
                      fontSize: 20,
                      stroke: true,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: adjustValue(context, 30),
              ),

              Text(
                "ماذا تريد أن تكون؟",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: adjustValue(context, 50.0),
                  fontFamily: 'Cairo',
                  color: AppColors.primaryDark,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_outlined),
              onPressed: (){
                Navigator.push(
                  context,
                  LeftRightPageRoute(const RegistrationGender(), -1, 0),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: true,
      onFloatingActionButtonTap: () {
        Navigator.push(
          context, 
          LeftRightPageRoute(const LoginScreen(), 1, 0),
        );
      },
    );
  }
}
