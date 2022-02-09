import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/general/game_app_bar.dart';
import 'package:najme/components/themes/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/audios.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';


class ListeningTheme extends StatefulWidget {
  const ListeningTheme({Key? key}) : super(key: key);

  @override
  State<ListeningTheme> createState() => _ListeningThemeState();
}

class _ListeningThemeState extends State<ListeningTheme> {
  int answer = 0;
  bool playAudio = true;
  bool success = true;
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appBar: GameAppBar(
        context:context,
        gameName:'المستوى 66',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Expanded(child: SvgPicture.asset(Assets.ele)),
                    Expanded(
                      child: Text('أستمع وأختر',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: adjustValue(context, 27.0),
                            fontFamily: 'Cairo',
                            letterSpacing: 0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          )),
                    ),
                ],
          )),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          SvgPicture.asset(
                            Assets.circular,
                            height: adjustValue(context, 120.0),
                          ),
                          SvgPicture.asset(
                            playAudio ? Assets.play : Assets.audio,
                            height: adjustValue(context, 50.0),
                          )
                        ],
                      ),
                      onTap: () {
                        assetsAudioPlayer.open(
                          Audio(Audios.clap),
                        );
                        assetsAudioPlayer.playOrPause();
                        setState(() {
                          playAudio = !playAudio;
                        });
                      },
                    ),
                  ),
                  Expanded(
                  child: InkWell(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SvgPicture.asset(Assets.circular,
                            height: adjustValue(context, 100.0)),
                        SvgPicture.asset(
                          Assets.snail,
                          height: adjustValue(context, 50.0),
                        )
                      ],
                    ),
                    onTap: () {
                      assetsAudioPlayer.open(
                        Audio(Audios.clap),
                      );

                      setState(() {

                        //player.setPlaybackRate(0.5);
                      });
                    },
                  ),
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
                            margin: EdgeInsets.all(adjustValue(context, 10.0)),
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
                          Text(
                            'أ',
                            style: TextStyle(
                              color:
                                  answer == 1 ? AppColors.white : AppColors.primary,
                              fontSize: adjustValue(context, 56),
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        assetsAudioPlayer.open(
                          Audio(Audios.clap),
                        );
                        setState(() {
                          answer = 1;
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
                            margin: EdgeInsets.all(adjustValue(context, 10.0)),
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
                          Text(
                            'ب',
                            style: TextStyle(
                              color:
                                  answer == 2 ? AppColors.white : AppColors.primary,
                              fontSize: adjustValue(context, 56),
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        assetsAudioPlayer.open(
                          Audio(Audios.clap),
                        );
                        setState(() {
                          answer = 2;

                        });
                      },
                    ),
                  ),
                ],
          )),
        ],
      ),
    );
  }
}
