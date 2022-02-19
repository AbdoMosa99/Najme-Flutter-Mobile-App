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
import 'package:najme/utility.dart';
import 'lessons_screen.dart';
import 'package:najme/data.dart';


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
  @override
  Widget build(BuildContext context) {
    bool row_is_one = false;

    return FutureBuilder(
      future: database.getUnits(2),
      initialData: [],
      builder: (context, AsyncSnapshot<List> snapshot) {
        List<Unit> units = snapshot.data!.cast<Unit>();

        return snapshot.hasData
        ? SpaceContainer(
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
                  child: ListView(
                    children: [
                      for (int i = 0; i < units.length; i++, row_is_one = !row_is_one)
                      if (!row_is_one)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Galaxy(
                              context: context,
                              backEMG: Assets.galaxy,
                              img: units[i].icon,
                              text: units[i].name,
                              onClick: () {
                                Navigator.push(
                                  context,
                                  InOutPageRoute(const LessonsScreen(), Alignment.bottomCenter),
                                );
                              },
                            ),
                            if (++i < units.length)
                            Galaxy(
                              context: context,
                              backEMG: Assets.galaxy,
                              img: units[i].icon,
                              text: units[i].name,
                              onClick: () {
                                Navigator.push(
                                  context,
                                  InOutPageRoute(const LessonsScreen(), Alignment.bottomCenter),
                                );
                              },
                            ),
                          ],
                        )
                      else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Galaxy(
                            context: context,
                            backEMG: Assets.galaxy,
                            img: units[i].icon,
                            text: units[i].name,
                            onClick: () {
                              Navigator.push(
                                context,
                                InOutPageRoute(const LessonsScreen(), Alignment.bottomCenter),
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
      )    
      : Center(child: CircularProgressIndicator());
      },
    );
  }
}

