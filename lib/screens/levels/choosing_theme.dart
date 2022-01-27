import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/game_app_bar.dart';
import 'package:najme/components/themes/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/audios.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/space/lessons_screen.dart';
import 'package:najme/utility.dart';

class ChoosingTheme extends StatefulWidget {
  const ChoosingTheme({Key? key}) : super(key: key);

  @override
  _ChoosingThemeState createState() => _ChoosingThemeState();
}

class _ChoosingThemeState extends State<ChoosingTheme> {
  int answer = 0;
  bool playAudio = true;
  bool success = true;
  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appBar: GameAppBar(
        context:context,
        gameName:'المستوى 55',
        backButtonFunction: () {
          Navigator.pop(
            context,
            false
          );
        },
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SvgPicture.asset(Assets.rabbit)),
                Text('اختر الإجابة الصحيحة',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: adjustWidthValue(context, 27.0),
                      fontFamily: 'Cairo',
                      letterSpacing: 0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    )),
              ],
          )),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '=', 
                    style: TextStyle(
                      fontSize: adjustValue(context, 30.0),
                      fontFamily: 'Cairo',
                      letterSpacing: 0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.carrot,
                        height: adjustValue(context, 50.0),
                      ),
                      SvgPicture.asset(
                        Assets.carrot,
                        height: adjustValue(context, 50.0),
                  ),
                    ],
                  ),
                  Text(
                    '+',
                    style: TextStyle(
                      fontSize: adjustValue(context, 30.0),
                      fontFamily: 'Cairo',
                      letterSpacing: 0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    )
                  ),
                  SvgPicture.asset(
                    Assets.carrot,
                    height: adjustValue(context, 50.0),
                  ),
                ],
          )),
          Expanded(
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(adjustValue(context, 3.0)),
                                decoration: BoxDecoration(
                                  color: answer == 1
                                      ? AppColors.primary
                                      : AppColors.surface,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.carrot,
                                        height: adjustValue(context, 40.0),
                                      ),
                                      SvgPicture.asset(
                                        Assets.carrot,
                                        height: adjustValue(context, 40.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.carrot,
                                        height: adjustValue(context, 40.0),
                                      ),
                                    ],
                                  ),                        
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              answer = 1;
                              player.play(Audios.clap);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(adjustValue(context, 8.0)),
                        child: Text(
                          'أم',
                          style: TextStyle(
                            fontSize: adjustValue(context, 25.0),
                            fontFamily: 'Cairo',
                            // fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(adjustValue(context, 3.0)),
                                decoration: BoxDecoration(
                                  color: answer == 2
                                      ? AppColors.primary
                                      : AppColors.surface,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.carrot,
                                        height: adjustValue(context, 40.0),
                                      ),
                                      SvgPicture.asset(
                                        Assets.carrot,
                                        height: adjustValue(context, 40.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.carrot,
                                        height: adjustValue(context, 40.0),
                                      ),
                                      SvgPicture.asset(
                                        Assets.carrot,
                                        height: adjustValue(context, 40.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              answer = 2;
                              player.play(Audios.clap);
                            });
                          },
                        ),
                      ),
                    ],
              )
          ),
        ],
      ),
    );
  }
}
