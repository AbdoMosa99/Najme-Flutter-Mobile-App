import 'package:flame/components.dart';

class planetData {
  String fileName;
  String name;
  Vector2 size;
  Vector2 initialPosition;
  Vector2 finalPosition;
  Vector2 realtySize;
  int hisPosition;
  final listDescription;

  planetData({
    required this.fileName,
    required this.name,
    required this.size,
    required this.initialPosition,
    required this.finalPosition,
    required this.realtySize,
    required this.hisPosition,
    required this.listDescription
  });
}
    //for test the description
    final listDescriptionTest = [
      "كلام كلام كلام كلام",
      "كلام كلام كلام كلام",
      "كلام كلام كلام كلام",
      "كلام كلام كلام كلام",
      "كلام كلام كلام كلام",
    ];

final planetsData = [
  planetData(
    fileName: "space_game/p1.png",
    name: "عطارد",
    size: Vector2(30, 30),
    realtySize: Vector2(35,35),
    initialPosition: Vector2(245, 114),
    finalPosition: Vector2(60, 310),
    hisPosition: 1,
    listDescription: listDescriptionTest
  ),
  planetData(
    fileName: "space_game/p2.png",
    name: "الزهرة",
    size: Vector2(30, 30),
    realtySize: Vector2(39,39),
    initialPosition: Vector2(164, 116),
    finalPosition: Vector2(90, 373),
    hisPosition: 2,
    listDescription: listDescriptionTest
  ),
  planetData(
    fileName: "space_game/p3.png",
    name: "الأرض",
    size: Vector2(30, 30),
    realtySize: Vector2(41,41),
    initialPosition: Vector2(334, 105),
    finalPosition: Vector2(129, 291),
    hisPosition: 3,
    listDescription: listDescriptionTest
  ),
  planetData(
    fileName: "space_game/p4.png",
    name: "المريخ",
    size: Vector2(30, 30),
    realtySize: Vector2(37,37),
    initialPosition: Vector2(56, 151),
    finalPosition: Vector2(177, 389),
    hisPosition: 4,
    listDescription: listDescriptionTest
  ),
  planetData(
    fileName: "space_game/p5.png",
    name: "المشترى",
    size: Vector2(30, 30),
    realtySize: Vector2(49,49),
    initialPosition: Vector2(286, 159),
    finalPosition: Vector2(227, 319),
    hisPosition: 5,
    listDescription: listDescriptionTest
  ),
  planetData(
    fileName: "space_game/p6.png",
    name: "زحل",
    size: Vector2(40, 30),
    realtySize: Vector2(70,68),
    initialPosition: Vector2(168, 153),
    finalPosition: Vector2(157, 185),
    hisPosition: 6,
    listDescription: listDescriptionTest
  ),
  planetData(
    fileName: "space_game/p7.png",
    name: "أورانوس",
    size: Vector2(40, 30),
    realtySize: Vector2(47,51),
    initialPosition: Vector2(100, 153),
    finalPosition: Vector2(312, 385),
    hisPosition: 7,
    listDescription: listDescriptionTest
  ),
  planetData(
    fileName: "space_game/p8.png",
    name: "نبتون",
    size: Vector2(30, 30),
    realtySize: Vector2(43,43),
    initialPosition: Vector2(79, 95),
    finalPosition: Vector2(291, 193),
    hisPosition: 8,
    listDescription: listDescriptionTest
  ),
];
