import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/main_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/database/models.dart';
import 'package:najme/screens/registeration/registration_address.dart';
import 'package:najme/utility.dart';

import '../../components/general/error_message.dart';
import '../../components/screen_specific/registration/registration_topLayer.dart';

class RegistrationLevel extends StatefulWidget {
  RegistrationLevel({
    Key? key,
    required this.profileData,
  }) : super(key: key);
  
  Profile profileData;

  @override
  _RegistrationLevelState createState() => _RegistrationLevelState();
}

class _RegistrationLevelState extends State<RegistrationLevel> {
  List<String> my_levels = ["a", "c"];
  int level = 0;
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
                SvgPicture.asset(
                  Assets.nextLevel,
                  height: adjustHeightValue(context, 170),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: adjustHeightValue(context, 8.0)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: levelList(
                            context: context,
                            levels: my_levels,
                            function: (int level_id){ setState(() {
                                level = level_id;
                              });},
                              active_level: level
                        ),
                      ),
                      if(!valid) ErrorMessage(
                        context: context,
                        message: "من فضلك اختر مرحلتك",
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
          ),

          TopLayer(
            context: context,
            width: 0.77,
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
        if (level != 0) {
          widget.profileData.level = my_levels[level - 1] ;

          setState(() {
            valid = true;
          });

          Navigator.push(
            context, 
            LeftRightPageRoute(RegistrationAddress(profileData: widget.profileData), 1, 0),
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

List<Widget> levelList(
  {
    required BuildContext context,
    required List<String> levels,
    required Function function,
    required int active_level
 }
) {
  List<Widget> list = [];

  for (int i = 0; i < levels.length; i++) {
    int level_id = i + 1;
    list.add(
      MainCard(
        context: context,
        text: levels[i],
        onTap: () {
          function(level_id);
          print(level_id);
        },
        color: active_level ==  level_id ? AppColors.primary : AppColors.surface,
        textColor: active_level ==  level_id ? AppColors.white : AppColors.primary,
        radius: 76.0,
        fontSize: 48.0,
        circle: true,
        padding: 20.0,
      ),
    );
  }
  return list;
}