import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:najme/games/biology/organ.dart';


class OrganPosition extends SpriteComponent with CollisionCallbacks {
  String icon;
  Vector2? dragDeltaPosition;
  bool get isDragging => dragDeltaPosition != null;

  OrganPosition({
    required this.icon,
    required size,
    required position
  }) : super(size: size, position: position);

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load(icon);
    anchor = Anchor.center;
    add(CircleHitbox());
    add(OpacityEffect.to(0.0, EffectController(duration: 0.1)));
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Organ && other.place == this) {
      add(OpacityEffect.to(0.5, EffectController(duration: 0.1)));
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (other is Organ && other.place == this) {
      add(OpacityEffect.to(0.0, EffectController(duration: 0.1)));
    }
  }
}
