import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:najme/games/space/planet.dart';
import 'package:najme/games/space/planet_data.dart';
import 'card.dart';
import 'game.dart';

class Slider extends PositionComponent with Draggable, HasGameRef<SpaceGame> {

  double? dragDeltaX;
  Vector2 in_position;
  bool is_tap = false;
  bool get isDragging => dragDeltaX != null;
  bool draggable = true;
  int next = 1;

  Slider(
    this.in_position
  ): super();

  @override
  Future<void>? onLoad() async {

    int i = 0;

    planetsData.shuffle(); //make the planets data order randomly

    //add cards and add to them their planets
    planetsData.forEach((planetData)  {
      Planet planet = Planet(
        icon: planetData.fileName,
        name: planetData.name,
        size: planetData.size,
        initialPosition: Vector2(40, 25),
        finalPosition: planetData.finalPosition,
        anchor: Anchor.center,
        realtySize: planetData.realtySize,
        hisPosition: planetData.hisPosition,
        listDescription: planetData.listDescription
      );

      Card card = Card(
        initial_position: Vector2((i*125)+10, 0),
        size: Vector2(115, 145),
        planet: planet
      );
      add(card);

      i += 1;
    });
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    this.size = Vector2(125*8+22, 145);
    position = in_position;
  }

  @override
  bool onDragStart(DragStartInfo info) {
      dragDeltaX = info.eventPosition.game.x - position.x;
    return true;
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    if(isDragging && draggable){
      final localCords = info.eventPosition.game.x;
      final new_x = localCords - dragDeltaX!;
      final new_end = new_x + size.x;

      if(new_x <= 0 && new_end >= gameRef.size.x){
        position.x = new_x;
      }
    }
    return true;
  }

  @override
  bool onDragEnd(_) {
    dragDeltaX = null;
    return true;
  }

  @override
  bool onDragCancel() {
    dragDeltaX = null;
    return true;
  }
}
