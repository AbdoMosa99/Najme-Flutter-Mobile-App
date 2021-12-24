import 'package:flutter/material.dart';
import 'package:najme/components/general/app_bar.dart';
import 'package:najme/components/general/drawer.dart';
import 'package:najme/components/screen_specific/space/space_main_container.dart';
import 'package:najme/components/screen_specific/space/space_star_dark.dart';
import 'package:najme/components/screen_specific/space/sparial_sta.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import '../../utility.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({Key? key}) : super(key: key); 
  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  int level=0;
  @override
  Widget build(BuildContext context) {
    return SpaceContainer(
      appBar: MainAppBar(context: context,),
      drawer: MainDrawer(context: context,),
      child:Column(
        children: [
          Container( 
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), 
                color:const Color.fromRGBO( 80 , 54 , 164 , 0.5) ,
                ),
            child: Text(
              'حساب: الوحدة الاولى ',
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
                Row(
                  children: [
                    SparialStar(backEMG:Assets.star,text: 'رقم 2',),
                    SparialStar(backEMG:Assets.star,text: 'رقم 1',),
                    ],
                  ),
                Row(
                  children: [
                    SparialStar(backEMG:Assets.star,text: 'العد ل2',),
                    ],
                  ),
                Row(
                  children: [
                    SparialStarDark(backEMG:Assets.star,text: 'العد ل3',),
                    SparialStar(backEMG:Assets.star,text: 'رقم 3',),
                    ],
                  ),
                Row(
                  children: [
                    SparialStarDark(backEMG:Assets.star,text: 'رقم ',),
                    ],
                  ),
                Row(
                  children: [
                    SparialStarDark(backEMG:Assets.star,text: 'رقم ',),
                    SparialStarDark(backEMG:Assets.star,text: 'رقم',)
                    ],
                  ),
              ],
                  reverse: true,
                ),
            )      
      ],
     // reverse: true,
    )
  );
}
}