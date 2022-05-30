import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/game_app_bar.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/audios.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/question/choosing_theme.dart';
import 'package:najme/screens/question/order_game.dart';
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
        context: context,
        gameName: 'المستوى 66',
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
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Stack(alignment: Alignment.center, children: [
                          Center(
                            child: SimpleDialog(
                              backgroundColor: AppColors.surface,
                              contentPadding: EdgeInsetsDirectional.only(
                                bottom: adjustValue(context, 30),
                                top: adjustValue(context, 50),
                              ),
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.success_star,
                                          width: adjustWidthValue(context, 105),
                                          height:
                                              adjustHeightValue(context, 105),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: adjustHeightValue(context, 70.0),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SvgPicture.asset(
                                            Assets.xLighting,
                                            width:
                                                adjustWidthValue(context, 60),
                                            height:
                                                adjustHeightValue(context, 60),
                                          ),
                                          SvgPicture.asset(
                                            Assets.lighting,
                                            width:
                                                adjustWidthValue(context, 60),
                                            height:
                                                adjustHeightValue(context, 60),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    '!أحسنت',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: adjustValue(context, 25),
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '!لقد ربحت نجمة أخرى',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: adjustValue(context, 20),
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: adjustHeightValue(context, 10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: adjustWidthValue(context, 80),
                                      child: FloatingActionButton(
                                        backgroundColor: AppColors.primary,
                                        child: Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Icon(
                                            Icons.arrow_back,
                                            size: adjustValue(context, 30.0),
                                            color: AppColors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            InOutPageRoute(const OrderGame(), Alignment.bottomCenter),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: adjustWidthValue(context, 80),
                                      child: FloatingActionButton(
                                        backgroundColor: AppColors.primary,
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Icon(
                                            Icons.refresh_outlined,
                                            size: adjustValue(context, 30.0),
                                            color: AppColors.white,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                )
                              ],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  adjustValue(context, 30),
                                ),
                                bottomRight: Radius.circular(
                                  adjustValue(context, 30),
                                ),
                                topRight: Radius.circular(
                                  adjustValue(context, 150),
                                ),
                                topLeft: Radius.circular(
                                  adjustValue(context, 150),
                                ),
                              )),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                top: adjustHeightValue(context, 370.0),
                              ),
                              child: SizedBox(
                                width: adjustWidthValue(context, 180),
                                height: adjustHeightValue(context, 50),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        adjustValue(context, 15.0)),
                                  ),
                                  color: AppColors.primary,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      InOutPageRoute(const ChoosingTheme(), Alignment.bottomCenter),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'الدرس التالي',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Cairo',
                                          color: AppColors.white,
                                          fontSize: adjustValue(context, 20.0),
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        Assets.double_arrow,
                                        width: adjustWidthValue(context, 30),
                                        height: adjustHeightValue(context, 30),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: adjustValue(context, 255.0),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.banner,
                                  width: adjustWidthValue(context, 512),
                                  height: adjustHeightValue(context, 512),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: adjustValue(context, 60)),
                                  child: Text(
                                    '!تهانينا',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: adjustValue(context, 30),
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]);
                      },
                    );
                    // assetsAudioPlayer.open(
                    //   Audio(Audios.clap),
                    // );
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
