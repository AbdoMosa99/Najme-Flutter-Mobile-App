import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/input.dart';
import 'package:flutter/painting.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/games/space/planet.dart';
import 'game.dart';
import 'info_button.dart';

class Card extends SpriteComponent with Tappable, HasGameRef<SpaceGame> {

  Planet planet;
  Vector2 initial_position;
  late SpriteComponent blackCircleSprite;
  late SpriteComponent doneSprite;
  late SpriteComponent wrongSprite;
  late SpriteComponent windowBGSprite;
  late SpriteComponent closeSprite;
  late SpriteComponent notInfoButtonSprite;

  late InfoButton infoButton;

  Card({
    required this.planet,
    required this.initial_position,
    required Vector2 size,
  }): super(size: size);

  @override
  Future<void>? onLoad() async {
    //to create and add black circle sprite behind the planet in card
    Sprite blackCircle = await Sprite.load("space_game/blackC.png");
    blackCircleSprite = SpriteComponent(
      sprite: blackCircle,
      size: Vector2(50, 50),
      position: Vector2(30, 12),
    );
    add(blackCircleSprite);

    //to create and add background card sprite
    sprite = await Sprite.load("space_game/card.png");
    add(planet);

    //to create and add wrong circle sprite when click on a wrong planet
    Sprite wrong = await Sprite.load("space_game/wrong.png");
        wrongSprite = SpriteComponent(
        sprite: wrong,
        size: Vector2(50, 50),
        position: Vector2(30, 12),
      );
      wrongSprite.add(OpacityEffect.fadeOut(EffectController(duration: 0.1)));
      add(wrongSprite);

    //to create and add done circle sprite when click on a next planet
    Sprite done = await Sprite.load("space_game/done.png");
      doneSprite = SpriteComponent(
      sprite: done,
      size: Vector2(50, 50),
      position: Vector2(30, 12),
    );
    doneSprite.add(OpacityEffect.fadeOut(EffectController(duration: 0.1)));
    add(doneSprite);

    //to create and add the planet name TextComponent on card
    //to create the style to text
    TextStyle style = TextStyle(
      color: AppColors.primaryDark,
      fontSize: 24.0,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w800,

    );
    TextPaint regular = TextPaint(style: style);

    //create TextComponent and add the style
    TextComponent text = TextComponent(text: planet.name,
    textRenderer: regular,
    );
    text.anchor = Anchor.topCenter;
    text.x = (size.x / 2)-5;
    text.y = (size.y / 2)-20;
    add(text);

    //to add information button to show the planet card information
    infoButton = InfoButton(
      initial_position: Vector2((size.x/2)+3,120),
      size: Vector2(77, 44),
      planet: planet
    );

    //to add not solve button when planet not be in his place
    Sprite notInfoButton = await Sprite.load("space_game/not_info_button.png");
      notInfoButtonSprite = SpriteComponent(
      sprite: notInfoButton,
      size: Vector2(77, 44),
      position: Vector2((size.x/2)+3,120),
      anchor: Anchor.center
    );
    add(notInfoButtonSprite);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    position = initial_position;
  }

@override
  bool onTapUp(TapUpInfo info) {

    //when click on the card that have the next planet
    if(!gameRef.slider.isDragging){
      if(planet.hisPosition == gameRef.slider.next){
        //show done circle
        doneSprite.add(OpacityEffect.fadeIn(EffectController(duration: 0.5)));

        //to select the current position to this card
        Vector2 curPosition = Vector2(
          position.x + planet.position.x + gameRef.slider.position.x,
          position.y + planet.position.y + gameRef.slider.position.y,
        );
        //create and add new planet to move
        Planet new_planet = Planet(
          icon: planet.icon,
          name: planet.name,
          initialPosition: curPosition,
          anchor: Anchor.bottomCenter,
          size: planet.realtySize,
          finalPosition: planet.finalPosition,
          realtySize: planet.realtySize,
          hisPosition: 0,
          listDescription: planet.listDescription
        );
        gameRef.add(new_planet);
        //move the new planet to his new position next to the sun
        new_planet.add(MoveToEffect(planet.finalPosition, EffectController(duration: 1)));

        //show the information button
        add(infoButton);
        infoButton.add(OpacityEffect.fadeIn(EffectController(duration: 1)));
        notInfoButtonSprite.add(OpacityEffect.fadeOut(EffectController(duration: 0.5)));

        //increase the next value to know the next planet
        gameRef.slider.next += 1;
      }
      else{
        //show the wrong circle
        wrongSprite.add(SequenceEffect([
          OpacityEffect.fadeIn(EffectController(duration: 0.5)),
          ScaleEffect.by(Vector2.all(1), EffectController(duration: 1)),
          OpacityEffect.fadeOut(EffectController(duration: 0.5)),
        ]));
      }
    }
    return super.onTapUp(info);
  }
}
