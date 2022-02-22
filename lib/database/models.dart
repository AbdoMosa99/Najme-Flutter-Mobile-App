
class Profile {
  final int id;
  String name;
  String gender;
  DateTime birthdate;
  String level;
  String city;
  String ambition;

  Profile({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthdate,
    required this.level,
    required this.city,
    required this.ambition,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'birthdate': birthdate.toString(),
      'level': level,
      'city': city,
      'ambition': ambition,
    };
  }

  static Profile fromMap(Map<String, dynamic> map){
    return Profile(
        id: map['id'],
        name: map['name'],
        gender: map['gender'],
        birthdate: DateTime.parse(map['birthdate']),
        level: map['level'],
        city: map['city'],
        ambition: map['ambition']
    );
  }


  @override
  String toString() {
    return 'Profile{id: $id, name: $name, gender: $gender, birthdate: $birthdate, level: $level, city: $city, ambition: $ambition}';
  }

}



class Level {
  final int id;
  String name;

  Level ({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static Level fromMap(Map<String, dynamic> map) {
    return Level(
      id: map['id'], 
      name: map['name']
    );
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name}';
  }

}



class Subject {
  final int id;
  String category;
  String icon;
  String level;

  Subject({
    required this.id,
    required this.category,
    required this.icon,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'icon': icon,
      'level': level,
    };
  }

  static Subject fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'], 
      category: map['category'], 
      icon: map['icon'], 
      level: map['level']
    );
  }

  @override
  String toString() {
    return 'Lesson{id: $id, category: $category, icon: $icon, level: $level}';
  }
}



class Unit {
  final int id;
  int number;
  String name;
  String icon;
  int subjectID;

  Unit({
    required this.id,
    required this.number,
    required this.name,
    required this.icon,
    required this.subjectID,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'name': name,
      'icon': icon,
      'subject_id': subjectID,
    };
  }

  static Unit fromMap(Map<String, dynamic> map) {
    return Unit(
      id: map['id'], 
      number: map['number'], 
      name: map['name'], 
      icon: map['icon'], 
      subjectID: map['subject_id']
    );
  }

  @override
  String toString() {
    return 'Unit{id: $id, number: $number, name: $name, icon: $icon, subject_id: $subjectID}';
  }
}



class Lesson {
  final int id;
  int number;
  String name;
  int unitID;

  Lesson({
    required this.id,
    required this.number,
    required this.name,
    required this.unitID,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'name': name,
      'unit_id': unitID,
    };
  }

  static Lesson fromMap(Map<String, dynamic> map) {
    return Lesson(
      id: map['id'], 
      number: map['number'], 
      name: map['name'], 
      unitID: map['unit_id'],
    );
  }

  @override
  String toString() {
    return 'Lesson{id: $id, number: $number, name: $name, unit_id: $unitID}';
  }
}



class Progress {
  final int id;
  int stars;
  int fruits;
  int excellences;
  int profileId;
  int subjectId;
  int currentUnit;
  int currentLesson;

  Progress({
    required this.id,
    required this.stars,
    required this.fruits,
    required this.excellences,
    required this.profileId,
    required this.subjectId,
    required this.currentUnit,
    required this.currentLesson,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stars': stars,
      'fruits': fruits,
      'excellences': excellences,
      'profile_id': profileId,
      'subject_id': subjectId,
      'current_unit': currentUnit,
      'current_lesson': currentLesson,
    };
  }

  static Progress fromMap(Map<String, dynamic> map) {
    return Progress(
      id: map['id'], 
      stars: map['stars'], 
      fruits: map['fruits'], 
      excellences: map['excellences'], 
      profileId: map['profile_id'], 
      subjectId: map['subject_id'], 
      currentUnit: map['current_unit'], 
      currentLesson: map['current_lesson']
    );
  }

  @override
  String toString() {
    return 'Progress{id: $id, stars: $stars, fruits: $fruits, excellences: $excellences, currentUnit: $currentUnit, currentLesson: $currentLesson, profileID: $profileId, subjectID: $subjectId}';
  }
}
