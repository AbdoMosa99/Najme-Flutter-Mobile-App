import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';

import 'game.dart';
import 'organ_position.dart';


class Organ extends SpriteComponent with Draggable, CollisionCallbacks, HasGameRef<BiologyGame> {
  String icon;
  String name;
  Vector2? dragDeltaPosition;
  Vector2 initial_position;
  OrganPosition place;

  bool get isDragging => dragDeltaPosition != null;
  bool valid = false;
  bool draggable = true;
  
  Organ({
    required this.icon,
    required this.name,
    required this.initial_position,
    required Vector2 size,
    required this.place,
  }): super(size: size);

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load(icon);
    anchor = Anchor.center;
    add(CircleHitbox());
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    position = initial_position;
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other == place) {
      valid = true;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (other == place) {
      valid = false;
    }
  }

  @override
  bool onDragStart(DragStartInfo info) {
    if (draggable) {
      dragDeltaPosition = info.eventPosition.game - position;
      gameRef.text.text = name;
    }
    return false;
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    if (draggable && isDragging) {
      final localCoords = info.eventPosition.game;
      position = localCoords - dragDeltaPosition!;
    }
    return false;
  }

  @override
  bool onDragEnd(DragEndInfo info) {
    dragDeltaPosition = null;
    if (draggable) {
      if (valid) {
        position = place.position;
        draggable = false;
      }
      else {
        position = initial_position;
      }
      gameRef.text.text = gameRef.defaltText;
    }
    return false;
  }

  @override
  bool onDragCancel() {
    dragDeltaPosition = null;
    return false;
  }
}
