
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';


// for now - not complete nor valid
class NajmeGameWidget extends StatelessWidget {
  final FlameGame game;
  final Alignment backButtonAlignment;

  const NajmeGameWidget({ 
    Key? key,
    required this.game,
    required this.backButtonAlignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: game),
          Align(
            alignment: backButtonAlignment,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              icon: Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                  size: adjustValue(context, 32.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

