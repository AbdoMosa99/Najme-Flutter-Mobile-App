import '../database/models.dart';
import 'dart:math';
Random random = new Random();


Future<List<Subject>> subjects_api(String token, int profileID) async {
  
  return [
    Subject(
      id: random.nextInt(20), 
      category: "Arabic",
      icon: "/media/images/subjects/ima.jpeg", 
      level: 'KG1,'
      ),

      Subject(
      id: random.nextInt(20),
      category: "English", 
      icon: "/media/images/subjects/ima.jpeg", 
      level: 'KG2',
      ),
  ];
}

Future<List<Unit>> units_api(String token, int subjectID) async {

  return [
    Unit(
      id: random.nextInt(20), 
      number: random.nextInt(20),
      name: "Unit 1",
      icon: "/media/images/units/iamge.jpg", 
      subjectID: random.nextInt(20),
    ),

    Unit(
      id: random.nextInt(20), 
      number: random.nextInt(20),
      name: "Unit 2",
      icon: "/media/images/units/iamge.jpg", 
      subjectID: random.nextInt(20),
    ),
  ]; // not finished by abdallah
}

Future<List<Lesson>> lessons_api(String token, int unitID) async {
  
  return [
    Lesson(
    id: random.nextInt(20), 
    number: random.nextInt(20),  
    name: "Lesson 1",
    unitID: random.nextInt(20), 
    ),

    Lesson(
    id: random.nextInt(20), 
    number: random.nextInt(20),  
    name: "Lesson 2",
    unitID: random.nextInt(20), 
    ),
  ];
}


