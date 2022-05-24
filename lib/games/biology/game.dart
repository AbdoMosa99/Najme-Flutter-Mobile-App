import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:najme/games/biology/organ.dart';
import 'package:najme/games/biology/organ_position.dart';
import 'package:najme/games/biology/organs_data.dart';


class BiologyGame extends FlameGame with HasDraggables, HasCollisionDetection {
  late TextComponent text;
  String defaltText = 'ضع أعضاء الإنسان في مكانها الصحيح';

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

    // OrganPosition intestineSPos = OrganPosition('biology_game/Small intestine.png', Vector2(size.x/2, size.y / 2 + 100));
    // OrganPosition liverPos = OrganPosition('biology_game/liver.png', Vector2(size.x/2, size.y / 2 + 250));
    // OrganPosition lungLPos = OrganPosition('biology_game/lung1.png', Vector2(size.x/2, size.y / 2 + 300));
    // OrganPosition lungRPos = OrganPosition('biology_game/lung2.png', Vector2(size.x/2, size.y / 2 + 350));
    // OrganPosition stomachPos = OrganPosition('biology_game/stomach.png', Vector2(size.x/2, size.y / 2 + 400));
    

    // add(intestineSPos);
    // add(liverPos);
    // add(lungLPos);
    // add(lungRPos);
    // add(stomachPos);

  }
}
