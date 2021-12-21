import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/main_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration_screens/registeration_email.dart';
import 'package:najme/screens/registeration_screens/registeration_name.dart';
import 'package:najme/screens/registeration_screens/registration_date.dart';
import 'package:najme/screens/registeration_screens/registration_job.dart';
import 'package:najme/screens/registeration_screens/registration_level.dart';
import 'package:najme/utility.dart';

class RegistrationGender extends StatefulWidget {
  const RegistrationGender({Key? key}) : super(key: key);
  @override
  _RegistrationGenderState createState() => _RegistrationGenderState();
}

class _RegistrationGenderState extends State<RegistrationGender> {
  int isMale = -1;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: adjustValue(context, 48.0),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: adjustValue(context, 148.0),
                      height: adjustValue(context, 200.0),
                      child: MainCard(
                        context: context,
                        onTap: () {
                          setState(() {
                            isMale = 1;
                          });
                        },
                        image: SvgPicture.asset(Assets.male),
                        color: isMale == 1 ? AppColors.primary : AppColors.surface,
                        radius: 20.0,
                        stroke: true,
                      ),
                    ),

                    Container(
                      width: adjustValue(context, 148.0),
                      height: adjustValue(context, 200.0),
                      child: MainCard(
                        context: context,
                        onTap: () {
                          setState(() {
                            isMale = 0;
                          });
                        },
                        image: SvgPicture.asset(Assets.female),
                        color: isMale == 0 ? AppColors.primary : AppColors.surface,
                        radius: 20.0,
                        stroke: true,
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                "اختر نوعك!",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: adjustValue(context, 50.0),
                  fontFamily: 'Cairo',
                  color: AppColors.primaryDark,
                ),
              ),

              SizedBox(
                height: adjustValue(context, 64.0),
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
                  LeftRightPageRoute(const RegistrationName(), -1, 0),
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
          LeftRightPageRoute(const RegistrationBirthDate(), 1, 0),
        );
      },
    );
  }
}
