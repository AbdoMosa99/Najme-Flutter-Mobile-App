import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/input.dart';
import 'package:flutter/painting.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/games/space/planet.dart';
import 'game.dart';

class InfoCard extends SpriteComponent with Tappable, HasGameRef<SpaceGame> {

  Planet planet;
  late SpriteComponent windowBGSprite;
  late SpriteComponent blackBGSprite;
  late TextComponent text;
  late SpriteComponent halfBlackCSprite;
  late SpriteComponent planetIconSprite;
  late TextComponent textDescription;

  InfoCard({
    required this.planet,
    required Vector2 size,
  }): super(size: size);

  @override
  Future<void>? onLoad() async {
    //to create and add black shadow behind the information card
    Sprite blackBG = await Sprite.load("space_game/blackBG.jpg");
    blackBGSprite = SpriteComponent(
      sprite: blackBG,
    );
    blackBGSprite.add(OpacityEffect.to(0.7, EffectController(duration: 0.0)));
    gameRef.add(blackBGSprite);

    //to create and add background card
    Sprite windowBG = await Sprite.load("space_game/bigCard.png");
    windowBGSprite = SpriteComponent(
      sprite: windowBG,
      size: Vector2(400, 300),
      position: Vector2(
        gameRef.size.x/2,
        gameRef.size.y/2
      ),
      anchor: Anchor.center
    );
    gameRef.add(windowBGSprite);

    //to create the planet name
    TextStyle style = TextStyle(
      color: AppColors.primaryDark,
      fontSize: 24.0,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w800,
    );

    TextPaint regular = TextPaint(style: style);

    text = TextComponent(text: "كوكب " + planet.name,
    textRenderer: regular
    );
    text.anchor = Anchor.topCenter;
    text.x = (gameRef.size.x / 2) + 60;
    text.y = (gameRef.size.y / 2) - 135;
    gameRef.add(text);

    //to create the information text
    String finalDescription = "";
    planet.listDescription.forEach((description){
      finalDescription += description + " -" +"\n";
    });

    TextStyle styleDescription = TextStyle(
      color: AppColors.primaryDark,
      fontSize: 22.0,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w600,
    );

    TextPaint regularDescription = TextPaint(style: styleDescription);

    textDescription = TextComponent(text: finalDescription,
    textRenderer: regularDescription
    );
    textDescription.anchor = Anchor.topCenter;
    textDescription.x = (gameRef.size.x / 2) + 100;
    textDescription.y = (gameRef.size.y / 2) - 80 ;
    gameRef.add(textDescription);

    //to create the half black circle to be background for the planet icon
    Sprite halfBlackC = await Sprite.load("space_game/half_blackC.png");
    halfBlackCSprite = SpriteComponent(
      sprite: halfBlackC,
      size: Vector2(150, 300),
      position: Vector2(
        (gameRef.size.x/2) - 125,
        gameRef.size.y/2
      ),
      anchor: Anchor.center
    );
    gameRef.add(halfBlackCSprite);

    //to add planet icon
    Sprite planetIcon = await Sprite.load(planet.icon);
    planetIconSprite = SpriteComponent(
      sprite: planetIcon,
      size: planet.realtySize + Vector2(30, 30),
      position: Vector2(
        (gameRef.size.x/2) - 120,
        gameRef.size.y/2
      ),
      anchor: Anchor.center
    );
    gameRef.add(planetIconSprite);

    //to create the close button
    sprite = await Sprite.load("space_game/blue_x.png");
    size = size;
    anchor = Anchor.center;
    priority = 2;

    //make the slider can't drag
    gameRef.slider.draggable = false;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    position = Vector2(
      (gameRef.size.x/2)+160,
      (gameRef.size.y/2)-120
    );
  }

@override
  bool onTapUp(TapUpInfo info) {
    //remove all sprites in information card
    gameRef.removeAll([
      windowBGSprite,
      blackBGSprite,
      text,
      halfBlackCSprite,
      planetIconSprite,
      textDescription
    ]);

    //make the slider can drag
    gameRef.slider.draggable = true;

    //remove the close button
    removeFromParent();
    return super.onTapUp(info);
  }

}
