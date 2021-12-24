//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:najme/components/general/app_bar.dart';
import 'package:najme/components/general/drawer.dart';
import 'package:najme/components/screen_specific/space/space_main_container.dart';
import 'package:najme/components/screen_specific/space/space_star_dark.dart';
import 'package:najme/components/screen_specific/space/sparial_sta.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import '../../utility.dart';

class CategoyScreen extends StatefulWidget {
  const CategoyScreen({Key? key}) : super(key: key);
  @override
  _CategoyScreenState createState() => _CategoyScreenState();
}
class _CategoyScreenState extends State<CategoyScreen> {
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
                  borderRadius: BorderRadius.circular(20),  
                  color:const Color.fromRGBO( 80 , 54 , 164 , 0.5) ,
                ),
                child: Text(
                    'حساب',
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
                      children: [                              
                        SparialStar(backEMG: Assets.spiralStar,img:Assets.spiralIcon,text: ' الوحدة الثانية ',),
                        SparialStar(backEMG: Assets.spiralStar,img:Assets.spiralIcon,text:'الوحدة الاولى ',),
                          ],
                    ),
                    Row(
                      children: [                              
                        SparialStar(backEMG: Assets.spiralStar,img:Assets.spiralIcon, text: 'الوحدة الثالثة',),
                          ],
                    ),  
                    Row(
                      children: [                              
                        SparialStarDark(backEMG: Assets.spiralStar,img:Assets.spiralIcon,text: 'الوحدة الخامسة',),
                        SparialStar(backEMG: Assets.spiralStar,img:Assets.spiralIcon,text:'الوحدة الرابعة',),
                          ],
                    ),
                    Row(
                      children: [                         
                        SparialStarDark(backEMG: Assets.spiralStar,img:Assets.spiralIcon,text:"الوحدة السادسة",),
                        ],
                      ),                  
                    Row(
                      children: [                         
                        SparialStarDark( backEMG: Assets.spiralStar,img:Assets.spiralIcon,text: 'الوحدة ',),
                        SparialStarDark(backEMG: Assets.spiralStar,img:Assets.spiralIcon,text:'الوحدة ',),          
                          ],
                    ),
                    Row(
                      children: [                         
                        SparialStarDark( backEMG: Assets.spiralStar,img:Assets.spiralIcon,text: 'الوحدة ',),         
                          ],
                    ),      
                      ],
                      reverse: true,
                  ),
              )
            ] ,
             //reverse: true,  
        ),
      ),        
    );    
  }
}

