import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/games/dino_game/game/audio_manager.dart';
import 'package:najme/games/dino_game/game/dino_run.dart';
import 'package:najme/games/dino_game/models/player_data.dart';
import 'package:najme/games/dino_game/widgets/pause_menu.dart';
import 'package:provider/provider.dart';

// This represents the head up display in game.
// It consists of, current score, high score,
// a pause button and number of remaining lives.
class Hud extends StatelessWidget {
  // An unique identified for this overlay.
  static const id = 'Hud';

  // Reference to parent game.
  final DinoRun gameRef;

  const Hud(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: gameRef.playerData,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Selector<PlayerData, int>(
                  selector: (_, playerData) => playerData.currentScore,
                  builder: (_, score, __) {
                    return Text(
                      'عدد حروف التي جمعتها: $score',
                      style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 20,
                          color: Colors.white),
                    );
                  },
                ),
                Selector<PlayerData, int>(
                  selector: (_, playerData) => playerData.currentScore,
                  builder: (_, score, __) {
                    return Text(
                      'عدد العملات التي جمعتها: $score',
                      style: const TextStyle(
                          fontFamily: 'Cairo', 
                          color: Colors.white
                      ),
                    );
                  },
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                gameRef.overlays.remove(Hud.id);
                gameRef.overlays.add(PauseMenu.id);
                gameRef.pauseEngine();
                AudioManager.instance.pauseBgm();
              },
              child: const Icon(Icons.pause, color: Colors.white),
            ),
            Selector<PlayerData, int>(
              selector: (_, playerData) => playerData.lives,
              builder: (_, lives, __) {
                return Row(
                  children: List.generate(5, (index) {
                    if (index < lives) {
                      return const Icon(
                        Icons.star,
                        color: AppColors.secondary,
                      );
                    } else {
                      return const Icon(
                        Icons.star_border_sharp,
                        color: AppColors.secondary,
                      );
                    }
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
