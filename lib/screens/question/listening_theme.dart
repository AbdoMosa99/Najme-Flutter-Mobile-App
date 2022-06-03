import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/general/game_app_bar.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/audios.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/dialogs/success_dialog.dart';
import 'package:najme/utility.dart';

class ListeningTheme extends StatefulWidget {
  const ListeningTheme({Key? key}) : super(key: key);

  @override
  State<ListeningTheme> createState() => _ListeningThemeState();
}

class _ListeningThemeState extends State<ListeningTheme> {
  int answer = 0;
  bool playAudio = true;
  bool finish = false;
  bool success = true;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appBar: GameAppBar(
        context: context,
        gameName: 'المستوى 1',
        backButtonFunction: () {
          Navigator.pop(context, false);
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
                child: Text('استمع واختر',
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
              SvgPicture.asset(
                Assets.listening_arrow,
              ),
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
                      Audio(Audios.frasha),
                      autoStart: playAudio,
                    );
                    setState(() {
                      playAudio = !playAudio;
                    });
                  },
                ),
              ),
              SvgPicture.asset(
                Assets.listening_arrow2,
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
                        margin: EdgeInsets.all(adjustValue(context, 5.0)),
                        decoration: BoxDecoration(
                          color: answer == 1
                              ? Colors.red.shade200
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
                      SvgPicture.asset(
                        Assets.panda,
                        height: adjustValue(context, 90.0),
                      ),
                    ],
                  ),
                  onTap: () {
                    assetsAudioPlayer.open(
                      Audio(Audios.wrongBuzzer),
                    );
                    setState(() {
                      answer = 1;
                    });
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(adjustValue(context, 5.0)),
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
                      SvgPicture.asset(
                        Assets.butterfly,
                        height: adjustValue(context, 90.0),
                      ),
                    ],
                  ),
                  onTap: () {
                    assetsAudioPlayer.open(
                      Audio(Audios.trueAns),
                    );
                    setState(() {
                      answer = 2;
                    });
                    showDialog(
                      context: context,
                      builder: (context) {
                        return showsuccessDialog(context);
                      },
                    );
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
