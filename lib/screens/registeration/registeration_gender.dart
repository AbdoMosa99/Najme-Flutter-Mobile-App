import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/main_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration/registration_date.dart';
import 'package:najme/utility.dart';

import '../../components/general/error_message.dart';
import '../../components/screen_specific/registration/registration_topLayer.dart';
import '../../database/models.dart';

class RegistrationGender extends StatefulWidget {
  RegistrationGender({
    Key? key,
    required this.profileData,
  }) : super(key: key);

  Profile profileData;
  @override
  _RegistrationGenderState createState() => _RegistrationGenderState();
}

class _RegistrationGenderState extends State<RegistrationGender> {
  int isMale = -1;
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      paddingAll: 0.0,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(adjustValue(context, 20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: adjustHeightValue(context, 8.0),
                              horizontal: adjustWidthValue(context, 8.0),
                            ),
                            child: AspectRatio(
                              aspectRatio: 3 / 4,
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
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: adjustHeightValue(context, 8.0),
                              horizontal: adjustWidthValue(context, 8.0),
                            ),
                            child: AspectRatio(
                              aspectRatio: 3 / 4,
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
                          ),
                        ),
                      ],
                    ),
                    if(!valid) ErrorMessage(
                      context: context,
                      message: "من فضلك اختر نوعك!",
                    ),
                  ],
                ),

                Text(
                  "أختر نوعك!",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: adjustValue(context, 40.0),
                    fontFamily: 'Cairo',
                    color: AppColors.primaryDark,
                  ),
                ),
              ],
            ),
          ),

          
          TopLayer(
            context: context,
            width: 0.55,
            onPressed: (){
              Navigator.pop(
                  context,false
              );
            },
          ),
        ],
      ),

      floatingActionButton: true,
      onFloatingActionButtonTap: () {
        if (isMale != -1) { 
          widget.profileData.gender = (isMale == 1)? "male" : "female";
          setState(() {
            valid = true;
          });
          Navigator.push(
            context, 
            LeftRightPageRoute(RegistrationBirthDate(profileData: widget.profileData), 1, 0),
          );

        }
        else{
          setState(() {
            valid = false;
          });
        }
      },
    );
  }
}
