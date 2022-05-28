import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/dino_game/game/audio_manager.dart';
import 'package:najme/dino_game/game/dino_run.dart';
import 'package:najme/dino_game/models/player_data.dart';
import 'package:najme/dino_game/widgets/hud.dart';
import 'package:najme/dino_game/widgets/main_menu.dart';
import 'package:provider/provider.dart';

// This represents the game over overlay,
// displayed with dino runs out of lives.
class GameOverMenu extends StatelessWidget {
  // An unique identified for this overlay.
  static const id = 'GameOverMenu';

  // Reference to parent game.
  final DinoRun gameRef;

  const GameOverMenu(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: gameRef.playerData,
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: AppColors.primary.withAlpha(100),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    const Text(
                      'انتهت اللعبة',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 40,
                          color: Colors.white),
                    ),
                    Selector<PlayerData, int>(
                      selector: (_, playerData) => playerData.currentScore,
                      builder: (_, score, __) {
                        return Text(
                          'العملات النقدية التي فوزت بها: ${score}',
                          style: const TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: Colors.white),
                        );
                      },
                    ),
                    MainButton(
                      context: context,
                      text: 'البدء من جديد',
                      color: AppColors.secondary,
                      onTap: () {
                        gameRef.overlays.remove(GameOverMenu.id);
                        gameRef.overlays.add(Hud.id);
                        gameRef.resumeEngine();
                        gameRef.reset();
                        gameRef.startGamePlay();
                        AudioManager.instance.resumeBgm();
                      },
                    ),
                    MainButton(
                      context: context,
                      text: 'خروج',
                      color: AppColors.secondary,
                      onTap: () {
                        gameRef.overlays.remove(GameOverMenu.id);
                        gameRef.overlays.add(MainMenu.id);
                        gameRef.resumeEngine();
                        gameRef.reset();
                        AudioManager.instance.resumeBgm();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
