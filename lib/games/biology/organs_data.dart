
import 'package:flame/components.dart';

class OrganData {
  String fileName;
  String name;
  Vector2 size;
  Vector2 initialPos;
  Vector2 finalPos;

  OrganData({
    required this.fileName,
    required this.name,
    required this.size,
    required this.initialPos,
    required this.finalPos
  });
}

final organsData = [
  OrganData(
    fileName: "biology_game/trachea.png",
    name: "القصبة الهوائية",
    size: Vector2(100, 125),
    initialPos: Vector2(245, 114),
    finalPos: Vector2(205, 433),
  ),
  OrganData(
    fileName: "biology_game/Large intestine.png",
    name: "الأمعاء الغليظة",
    size: Vector2(100, 125),
    initialPos: Vector2(164, 116),
    finalPos: Vector2(203, 618),
  ),
  OrganData(
    fileName: "biology_game/Small intestine.png",
    name: "الأمعاء الدقيقة",
    size: Vector2(77, 80),
    initialPos: Vector2(334, 105),
    finalPos: Vector2(203, 622),
  ),
  OrganData(
    fileName: "biology_game/unknown2.png",
    name: "تجويف الفم",
    size: Vector2(100, 125),
    initialPos: Vector2(56, 151),
    finalPos: Vector2(203, 366),
  ),
  OrganData(
    fileName: "biology_game/stomach.png",
    name: "المعدة",
    size: Vector2(77, 84),
    initialPos: Vector2(286, 159),
    finalPos: Vector2(217, 546),
  ),
  OrganData(
    fileName: "biology_game/lung1.png",
    name: "الرئة اليمنى",
    size: Vector2(100, 125),
    initialPos: Vector2(168, 153),
    finalPos: Vector2(176, 481),
  ),
  OrganData(
    fileName: "biology_game/lung2.png",
    name: "الرئة اليسرى",
    size: Vector2(100, 125),
    initialPos: Vector2(100, 153),
    finalPos: Vector2(230, 481),
  ),
  OrganData(
    fileName: "biology_game/liver.png",
    name: "الكبد",
    size: Vector2(77, 56),
    initialPos: Vector2(79, 95),
    finalPos: Vector2(194, 540),
  ),
  OrganData(
    fileName: "biology_game/unknown1.png",
    name: "البنركرياس",
    size: Vector2(100, 108),
    initialPos: Vector2(346, 172),
    finalPos: Vector2(245, 535),
  ),
];
