import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/games/dino_game/game/dino_run.dart';
import 'package:najme/games/dino_game/widgets/hud.dart';
import 'package:najme/games/dino_game/widgets/settings_menu.dart';

// This represents the main menu overlay.
class MainMenu extends StatelessWidget {
  // An unique identified for this overlay.
  static const id = 'MainMenu';

  // Reference to parent game.
  final DinoRun gameRef;

  const MainMenu(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  Row(
                    children: [
                      const Text(
                        'A ',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 50,
                          color: AppColors.secondary,
                        ),
                      ),
                      const Text(
                        'قم بالحصول علي حرف',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  MainButton(
                      context: context,
                      text: 'بدء',
                      color: AppColors.secondary, 
                      onTap: (){
                        gameRef.startGamePlay();
                        gameRef.overlays.remove(MainMenu.id);
                        gameRef.overlays.add(Hud.id);
                      },
                  ),
                  MainButton(
                    context: context,
                    text: 'الأعدادات',
                    color: AppColors.secondary,
                    onTap: () {
                      gameRef.overlays.remove(MainMenu.id);
                      gameRef.overlays.add(SettingsMenu.id);
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return SettingsDialog();
                      //     });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
