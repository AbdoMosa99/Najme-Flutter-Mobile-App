import 'package:flame/components.dart';

class Planet extends SpriteComponent {
  String icon;
  String name;
  Vector2 initialPosition;
  Vector2 finalPosition;
  Anchor anchor;
  Vector2 realtySize;
  int hisPosition;
  final listDescription;
  
  Planet({
    required this.icon,
    required this.name,
    required this.initialPosition,
    required this.finalPosition,
    required this.anchor,
    required this.realtySize,
    required this.hisPosition,
    required this.listDescription,
    required Vector2 size,
  }): super(size: size);

  @override
  Future<void>? onLoad() async {
    //to load the planet icon
    sprite = await Sprite.load(icon);
    anchor = anchor;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    position = initialPosition;
  }
}
