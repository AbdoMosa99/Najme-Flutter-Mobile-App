import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:najme/games/biology/organ.dart';
import 'package:najme/games/biology/organ_position.dart';
import 'package:najme/games/biology/organs_data.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:najme/constants/audios.dart';
import 'package:najme/dialogs/success_dialog.dart';
import 'package:flutter/material.dart';





class BiologyGame extends FlameGame with HasDraggables, HasCollisionDetection {
  late TextComponent text;
  final String defaltText = 'ضع أعضاء الإنسان في مكانها الصحيح';
  int count = 0;
  final BuildContext context;
  bool playing = true;

  BiologyGame(this.context) : super();


  @override
  Future<void>? onLoad() async {
    Sprite bg_img = await Sprite.load("biology_game/biology_bg.png");
    SpriteComponent bg = SpriteComponent(
      sprite: bg_img,
      size: Vector2(411, 731),
    );
    add(bg);

    text = TextComponent(text: defaltText);
    text.anchor = Anchor.topCenter;
    text.x = size.x / 2;
    text.y = size.y - text.size.y - 10;
    add(text);

    organsData.forEach((organData) {
      OrganPosition organPos = OrganPosition(
        icon: organData.fileName,
        size: organData.size,
        position: organData.finalPos);
      Organ organ = Organ(
        icon: organData.fileName,
        name: organData.name,
        size: organData.size,
        initial_position: organData.initialPos,
        place: organPos
      );
      add(organPos);
      add(organ);
    });
  }

  @override 
  void update(double dt) {
    super.update(dt);
    if (playing && count == organsData.length) {
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
