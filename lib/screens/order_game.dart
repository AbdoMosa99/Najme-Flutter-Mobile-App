import 'package:flutter/material.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/app_bar.dart';
import 'package:najme/components/general/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/utility.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/components/general/main_card.dart';


class OrderGame extends StatefulWidget {
  const OrderGame({ Key? key }) : super(key: key);

  @override
  _OrderGameState createState() => _OrderGameState();
}

class _OrderGameState extends State<OrderGame> {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appBar: MainAppBar(context: context,),
      drawer: MainDrawer(context: context,),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(Assets.crab),
                ),

                Expanded(
                  flex: 2,
                  child: Text(
                    "رتب الحروف",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: adjustValue(context, 40.0),
                      fontFamily: 'Cairo',
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
              ]
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SvgPicture.asset(Assets.smileFace),
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(adjustValue(context, 1.0)),
                    decoration: BoxDecoration(
                      //color: AppColors.secondary,  //,textColor: AppColors.primaryDark,20
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.secondaryLight,
                        width: adjustValue(context, 3),
                      ),
                    )
                  ),
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(adjustValue(context, 1.0)),
                    decoration: BoxDecoration(
                      //color: AppColors.secondary,  //,textColor: AppColors.primaryDark,20
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.secondaryLight,
                        width: adjustValue(context, 3),
                      ),
                    )
                  ),
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(adjustValue(context, 1.0)),
                    decoration: BoxDecoration(
                      //color: AppColors.secondary,  //,textColor: AppColors.primaryDark,20
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.secondaryLight,
                        width: adjustValue(context, 3),
                      ),
                    )
                  ),
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(adjustValue(context, 1.0)),
                    decoration: BoxDecoration(
                      //color: AppColors.secondary,  //,textColor: AppColors.primaryDark,20
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.secondaryLight,
                        width: adjustValue(context, 3),
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(adjustValue(context, 10.0)),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,  //,textColor: AppColors.primaryDark,20
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryDark,
                        width: adjustValue(context, 1),
                      ),
                    ),
                    
                    child: Text(
                      "ب",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: adjustValue(context, 33.0),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(adjustValue(context, 10.0)),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,  //,textColor: AppColors.primaryDark,20
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryDark,
                        width: adjustValue(context, 1),
                      ),
                    ),
                    
                    child: Text(
                      "أ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: adjustValue(context, 33.0),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(adjustValue(context, 10.0)),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,  //,textColor: AppColors.primaryDark,20
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryDark,
                        width: adjustValue(context, 1),
                      ),
                    ),
                    
                    child: Text(
                      "ث",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: adjustValue(context, 33.0),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(adjustValue(context, 10.0)),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,  //,textColor: AppColors.primaryDark,20
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryDark,
                        width: adjustValue(context, 1),
                      ),
                    ),
                    
                    child: Text(
                      "ت",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: adjustValue(context, 33.0),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            )
          )
        ],
      )
    );
  }
}

