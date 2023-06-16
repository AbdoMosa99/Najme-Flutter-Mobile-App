import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:najme/games/space/slider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:najme/constants/audios.dart';
import 'package:najme/dialogs/success_dialog.dart';
import 'package:flutter/material.dart' hide Slider;

class SpaceGame extends FlameGame with HasDraggables, HasTappables {

  late Slider slider;
  bool playing = true;
  final BuildContext context;

  SpaceGame(this.context) : super();

  @override
  Future<void>? onLoad() async {
    //create and add the sun background image
    Sprite bg_img = await Sprite.load("space_game/sun_bg.jpg");
    SpriteComponent bg = SpriteComponent(
      sprite: bg_img,
      size: Vector2(411, 731),
    );
    add(bg);

    //create and add the title game TextComponent
    TextComponent text = TextComponent(
      text: 'رتب كواكب المجموعة الشمسية'
    );
    text.anchor = Anchor.topCenter;
    text.x = size.x / 2;
    text.y = 50;
    add(text);

    //add slider to game
    slider = Slider(
      Vector2(0,size.y - 150)
    );
    add(slider);
  }

  @override 
  void update(double dt) {
    super.update(dt);
    if (playing && slider.next == 9) {
      final assetsAudioPlayer = AssetsAudioPlayer();
      assetsAudioPlayer.open(
        Audio(Audios.correctBuzzer),
      );
      showDialog(
        context: context,
        builder: (context) {
          return showsuccessDialog(context);
        },
      );
      playing = false;
    }
  }
}
