import 'package:flutter/material.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/app_bar.dart';
import 'package:najme/components/general/drawer.dart';
import 'package:najme/components/screen_specific/space/dark_galaxy.dart';
import 'package:najme/components/screen_specific/space/galaxy.dart';
import 'package:najme/components/screen_specific/space/space_main_container.dart';

import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/database/init.dart';
import 'package:najme/database/models.dart';
import 'package:najme/screens/question/choosing_theme.dart';
import '../../utility.dart';
import 'lessons_screen.dart';

class UnitsScreen extends StatefulWidget {
  const UnitsScreen({
    Key? key,
    required this.text,
    required this.subjectID,
  }) : super(key: key);

  final String text;
  final int subjectID;

  @override
  _UnitsScreenState createState() => _UnitsScreenState();
}
class _UnitsScreenState extends State<UnitsScreen> {

  // Database dbUnits = Database();
  // await dbUnits.init();
  // List<Unit> units = dbUnits.getUnits(dbUnits);
  // Progress progress = dbUnits.getProfile(profileID);


  @override
  Widget build(BuildContext context) {
    return SpaceContainer(
        appBar: MainAppBar(context: context,),
        drawer: MainDrawer(context: context,),
        child: Center(
          child:Column(
            children:[ 
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(adjustValue(context, 30)),
                    bottomRight: Radius.circular(adjustValue(context, 30)),
                  ),
                  color:const Color.fromRGBO( 80 , 54 , 164 , 0.5) ,
                ),
                child: Text(
                  widget.text,
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize:adjustValue(context, 30),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w800,
                        ),
                      ),
                padding: const EdgeInsets.all(0), 
                alignment: Alignment.center,
                      ),
              Expanded(
                child:ListView(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Galaxy(
                          context: context,
                          backEMG: Assets.galaxy,
                          img:Assets.two,
                          text: 'الوحدة الثالثة',
                          onClick: () {
                            Navigator.push(
                              context,
                              InOutPageRoute(const LessonsScreen(), Alignment.bottomCenter),
                            );
                          },
                        ),
                        Galaxy(
                          context: context,
                          backEMG: Assets.galaxy,
                          img:Assets.unit1,
                          text: 'الوحدة الثالثة',
                          onClick: () {
                            Navigator.push(
                              context,
                              InOutPageRoute(const LessonsScreen(), Alignment.bottomCenter),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Galaxy(
                          context: context,
                          backEMG: Assets.galaxy,
                          img:Assets.unit1,
                          text: 'الوحدة الثالثة',
                          onClick: () {
                            Navigator.push(
                              context,
                              InOutPageRoute(const LessonsScreen(), Alignment.bottomCenter),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DarkGalaxy(
                          context: context,
                          backEMG: Assets.galaxy,
                          img:Assets.unit1,
                          text: 'الوحدة الثالثة',
                          onClick: () {
                            Navigator.push(
                              context,
                              InOutPageRoute(const ChoosingTheme(), Alignment.bottomCenter),
                            );
                          },
                        ),
                        DarkGalaxy(
                          context: context,
                          backEMG: Assets.galaxy,
                          img:Assets.unit1,
                          text: 'الوحدة الثالثة',
                          onClick: () {
                            Navigator.push(
                              context,
                              InOutPageRoute(const ChoosingTheme(), Alignment.bottomCenter),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                  reverse: true,
                ),
              )
            ] ,
        ),
      ),        
    );    
  }
}

