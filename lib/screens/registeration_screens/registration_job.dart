import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/main_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';
import 'package:najme/screens/registeration_screens/registeration_gender.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: adjustHeightValue(context, 40.0),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: MainCard(
                        context: context,
                        onTap: () {
                          setState(() {
                            job = 1;
                          });
                        },
                        image: SvgPicture.asset(Assets.teacher),
                        text: 'مدرس',
                        color: job == 1 ? AppColors.primary : AppColors.surface,
                        textColor: job == 1 ? AppColors.white : AppColors.primary,
                        fontSize: 16,
                        stroke: true,
                      ),
                    ),
                  ),

                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: MainCard(
                        context: context,
                        onTap: () {
                          setState(() {
                            job = 2;
                          });
                        },
                        image: SvgPicture.asset(Assets.engineer),
                        text: 'مهندس',
                        color: job == 2 ? AppColors.primary : AppColors.surface,
                        textColor: job == 2 ? AppColors.white : AppColors.primary,
                        fontSize: 16,
                        stroke: true,
                      ),
                    ),
                  ),

                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: MainCard(
                        context: context,
                        onTap: () {
                          setState(() {
                            job = 3;
                          });
                        },
                        image: SvgPicture.asset(Assets.policeman),
                        text: 'ضابط',
                        color: job == 3 ? AppColors.primary : AppColors.surface,
                        textColor: job == 3 ? AppColors.white : AppColors.primary,
                        fontSize: 16,
                        stroke: true,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: MainCard(
                        context: context,
                        onTap: () {
                          setState(() {
                            job = 4;
                          });
                        },
                        image: SvgPicture.asset(Assets.doctor),
                        text: 'طبيب',
                        color: job == 4 ? AppColors.primary : AppColors.surface,
                        textColor: job == 4 ? AppColors.white : AppColors.primary,
                        fontSize: 16,
                        stroke: true,
                      ),
                    ),
                  ),

                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: MainCard(
                        context: context,
                        onTap: () {
                          setState(() {
                            job = 5;
                          });
                        },
                        image: SvgPicture.asset(Assets.programmer),
                        text: 'مبرمج',
                        color: job == 5 ? AppColors.primary : AppColors.surface,
                        textColor: job == 5 ? AppColors.white : AppColors.primary,
                        fontSize: 16,
                        stroke: true,
                      ),
                    ),
                  ),

                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: MainCard(
                        context: context,
                        onTap: () {
                          setState(() {
                            job = 6;
                          });
                        },
                        image: SvgPicture.asset(Assets.scientist),
                        text: 'عالم',
                        color: job == 6 ? AppColors.primary : AppColors.surface,
                        textColor: job == 6 ? AppColors.white : AppColors.primary,
                        fontSize: 16,
                        stroke: true,
                      ),
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
              
              SizedBox(
                height: adjustHeightValue(context, 20.0),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: adjustValue(context, 24.0),
                color: AppColors.primary,
              ),
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
