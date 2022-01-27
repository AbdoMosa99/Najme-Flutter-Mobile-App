import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/main_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration_screens/registration_address.dart';
import 'package:najme/screens/registeration_screens/registration_date.dart';
import 'package:najme/utility.dart';

class RegistrationLevel extends StatefulWidget {
  RegistrationLevel({
    Key? key,
    required this.registrationDate,
  }) : super(key: key);
  
  Map<String, dynamic> registrationDate;

  @override
  _RegistrationLevelState createState() => _RegistrationLevelState();
}

class _RegistrationLevelState extends State<RegistrationLevel> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.nextLevel,
                height: adjustHeightValue(context, 170),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: adjustHeightValue(context, 8.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      MainCard(
                        context: context,
                        text: "KG1",
                        onTap: () {
                          setState(() {
                            level = 1;
                          });
                        },
                        color: level == 1 ? AppColors.primary : AppColors.surface,
                        textColor: level == 1 ? AppColors.white : AppColors.primary,
                        radius: 76.0,
                        fontSize: 48.0,
                        circle: true,
                        padding: 20.0,
                      ),

                    MainCard(
                      context: context,
                      text: "KG2",
                      onTap: () {
                        setState(() {
                          level = 2;
                        });
                      },
                      color: level == 2 ? AppColors.primary : AppColors.surface,
                      textColor: level == 2 ? AppColors.white : AppColors.primary,
                      radius: 76.0,
                      fontSize: 48.0,
                      circle: true,
                      padding: 20.0,
                    ),
                  ],
                ),
              ),

              Text(
                "اختر مرحلتك!",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: adjustValue(context, 42.0),
                  fontFamily: 'Cairo',
                  color: AppColors.primaryDark,
                ),
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
                Navigator.pop(
                    context,false
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: true,
      onFloatingActionButtonTap: () {
        if (level != 0) {
          widget.registrationDate["level"] = level;

          Navigator.push(
            context, 
            LeftRightPageRoute(RegistrationAddress(registrationData: widget.registrationDate), 1, 0),
          );
        }
      },
    );
  }
}
