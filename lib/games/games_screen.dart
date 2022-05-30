import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/app_bar.dart';
import 'package:najme/components/general/drawer.dart';
import 'package:najme/components/general/main_card.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/games/biology/game.dart';
import 'package:najme/games/dino_game/game/dino_run_app.dart';
import 'package:najme/games/space/game.dart';
import 'package:najme/utility.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    final spaceGame = SpaceGame();
    final biology = BiologyGame();
    return MainContainer(
      appBar: MainAppBar(
        context: context,
      ),
      drawer: MainDrawer(
        context: context,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'مرحباً بك!',
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: adjustValue(context, 36.0),
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: MainCard(
                    context: context,
                    onTap: () {},
                    image: SvgPicture.asset(Assets.physics),
                    text: 'فيزياء',
                  ),
                ),
                SizedBox(
                  width: adjustValue(context, 15.0),
                ),
                Expanded(
                  child: MainCard(
                    context: context,
                    onTap: () {
                      Navigator.push(
                        context,
                        InOutPageRoute(GameWidget( game: spaceGame,),
                            Alignment.bottomCenter),
                      );
                    },
                    image: SvgPicture.asset(Assets.astronomy),
                    text: 'فلك',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: adjustValue(context, 15.0),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: MainCard(
                    context: context,
                    onTap: () {
                      Navigator.push(
                        context,
                        InOutPageRoute(GameWidget( game: biology,),
                            Alignment.bottomCenter),
                      );
                    },
                    image: SvgPicture.asset(Assets.biology),
                    text: 'أحياء',
                  ),
                ),
                SizedBox(
                  width: adjustValue(context, 15.0),
                ),
                Expanded(
                  child: MainCard(
                    context: context,
                    onTap: () {},
                    image: SvgPicture.asset(Assets.chemistry),
                    text: 'كيمياء',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}