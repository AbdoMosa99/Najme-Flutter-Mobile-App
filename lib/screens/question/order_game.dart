import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:najme/components/general/game_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/audios.dart';
import 'package:najme/dialogs/success_dialog.dart';
import 'package:najme/utility.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';


class OrderGame extends StatefulWidget {
  const OrderGame({ Key? key }) : super(key: key);

  @override
  _OrderGameState createState() => _OrderGameState();
}

class _OrderGameState extends State<OrderGame> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  int current = 0;
  final choices = {
    'أ' : false,
    'ب' : false,
    'ت' : false,
    'ث' : false,
  };
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appBar: GameAppBar(
        context:context,
        gameName:'المستوى 1',
        backButtonFunction: () {
          Navigator.pop(
              context,
              false
          );
        },
      ),
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
                      fontSize: adjustWidthValue(context, 36.0),
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
                  width: adjustWidthValue(context, 60.0),
                  height: adjustWidthValue(context, 60.0),
                  child: SvgPicture.asset(Assets.pufferFish),
                ),

                ...choices.keys.map((element) {
                  return DragTarget<String>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) 
                    {
                      if (choices[element] == true){ 
                        return Container(
                          width: adjustWidthValue(context, 60.0),
                          height: adjustWidthValue(context, 60.0),
                          margin: EdgeInsets.all(adjustValue(context, 1.0)),
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark,  
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.secondary,
                              width: adjustValue(context, 1),
                            ),
                          ),
                          child: Text(
                            element,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: adjustValue(context, 33.0),
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }
                      else{
                        return Container(
                          width: adjustWidthValue(context, 60.0),
                          height: adjustWidthValue(context, 60.0),
                          margin: EdgeInsets.all(adjustValue(context, 1.0)),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.secondaryLight,
                              width: adjustValue(context, 3.0),
                            ),
                          ),
                        );
                      }
                    },
                    onWillAccept: (data){
                      return data == element && element == choices.keys.toList()[current];
                    },
                    onLeave: (data) {
                      if (!(data == element && element == choices[current])) {
                        assetsAudioPlayer.open(
                          Audio(Audios.wrongBuzzer),
                        );
                      }
                    },
                    onAccept: (data) {
                      assetsAudioPlayer.open(
                        Audio(Audios.correctBuzzer),
                      );
                      setState(() {
                        choices[element] = true;
                      });
                      current++;

                      if (element == choices.keys.last) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return showsuccessDialog(context);
                          },
                        );
                      }
                    }
                    
                  );
                }).toList(),
              ],
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: choices.keys.map((element) {
                return Draggable<String>(
                  child: choices[element] == true ? Container() : Container(
                    width: adjustWidthValue(context, 60.0),
                    height: adjustWidthValue(context, 60.0),
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
                    width: adjustValue(context, 64.0),
                    height: adjustValue(context, 64.0),
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
                  childWhenDragging: Container(),
                );
              }).toList()..shuffle(),
            )
          )
        ],
      )
    );
  }
}

