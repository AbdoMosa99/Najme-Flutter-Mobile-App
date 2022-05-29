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
  }
}
