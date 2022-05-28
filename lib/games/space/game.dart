import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:najme/games/space/slider.dart';

class SpaceGame extends FlameGame with HasDraggables, HasTappables {

  late Slider slider;

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
}
