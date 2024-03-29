// The main widget for this game.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/games/dino_game/game/dino_run.dart';
import 'package:najme/games/dino_game/widgets/game_over_menu.dart';
import 'package:najme/games/dino_game/widgets/hud.dart';
import 'package:najme/games/dino_game/widgets/main_menu.dart';
import 'package:najme/games/dino_game/widgets/pause_menu.dart';
import 'package:najme/games/dino_game/widgets/settings_menu.dart';
import 'package:flame/game.dart';


class DinoRunApp extends StatelessWidget {
  DinoRunApp({Key? key}) : super(key: key);

  final DinoRun _dinoRun = DinoRun();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    return WillPopScope(
      onWillPop: () async{
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return true;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Audiowide',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // Settings up some default theme for elevated buttons.
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              fixedSize: const Size(200, 60),
            ),
          ),
        ),
        home: Scaffold(
          body: GameWidget(
            // This will dislpay a loading bar until [DinoRun] completes
            // its onLoad method.
            loadingBuilder: (conetxt) => const Center(
              child: SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  backgroundColor: AppColors.planetColor,
                  color: AppColors.secondary,
                ),
              ),
            ),
            // Register all the overlays that will be used by this game.
            overlayBuilderMap: {
              MainMenu.id: (_, DinoRun gameRef) => MainMenu(gameRef),
              PauseMenu.id: (_, DinoRun gameRef) => PauseMenu(gameRef),
              Hud.id: (_, DinoRun gameRef) => Hud(gameRef),
              GameOverMenu.id: (_, DinoRun gameRef) => GameOverMenu(gameRef),
              SettingsMenu.id: (_, DinoRun gameRef) => SettingsMenu(gameRef),
            },
            // By default MainMenu overlay will be active.
            initialActiveOverlays: const [MainMenu.id],
            game: _dinoRun,
          ),
        ),
      ),
    );
  }
}
