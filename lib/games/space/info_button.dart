import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/input.dart';
import 'package:flutter/painting.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/games/space/info_card.dart';
import 'package:najme/games/space/planet.dart';
import 'game.dart';

class InfoButton extends SpriteComponent with Tappable, HasGameRef<SpaceGame> {

  Planet planet;
  Vector2 initial_position;
  bool isInfo = false;


  InfoButton({
    required this.planet,
    required this.initial_position,
    required Vector2 size,
  }): super(size: size);

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("space_game/info_button.png");
    size = size;
    anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    position = initial_position;
  }

@override
  bool onTapUp(TapUpInfo info) {
    //to show the planet information card
    InfoCard infoCard = InfoCard(size: Vector2(50, 50), planet: planet);
    gameRef.add(infoCard);

    return super.onTapUp(info);
  }
}
