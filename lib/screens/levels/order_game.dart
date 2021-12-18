import 'package:flutter/material.dart';
import 'package:najme/components/general/game_app_bar.dart';
import 'package:najme/components/themes/main_container.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/utility.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:najme/screens/levels/order_placeholder.dart';



class OrderGame extends StatefulWidget {
  const OrderGame({ Key? key }) : super(key: key);

  @override
  _OrderGameState createState() => _OrderGameState();
}

class _OrderGameState extends State<OrderGame> {
  var player = AudioCache;
  final choices = ['أ', 'ب', 'ت', 'ث'];
  
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appBar: GameAppBar(context:context,gameName:'المستوى 21'),

      child: Column(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: adjustValue(context, 60.0),
                  height: adjustValue(context, 60.0),
                  child: SvgPicture.asset(Assets.smileFace),
                ),

                ...choices.map((element) {
                  return OrderPlaceholder(element: element,);
                }).toList(),
              ],
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: choices.map((element) {
                return Draggable(
                  child: Container(
                    width: adjustValue(context, 60.0),
                    height: adjustValue(context, 60.0),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,  
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryDark,
                        width: adjustValue(context, 1),
                      ),
                    ),
                  
                    child: Text(
                      element,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: adjustValue(context, 33.0),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  data: element,
                  feedback: Container(
                    width: adjustValue(context, 74.0),
                    height: adjustValue(context, 74.0),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryDark,
                        width: adjustValue(context, 1),
                      ),
                    ),
                  
                    child: Text(
                      element,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: adjustValue(context, 33.0),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  childWhenDragging: null,
                );
              }).toList(),
            )
          )
        ],
      )
    );
  }
}

