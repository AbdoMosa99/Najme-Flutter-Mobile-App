class Profile {
  final int id;
  String name;
  String gender;
  DateTime birthdate;
  int level;
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
    return 'Profile{name: $name, level: $level, city: $city}';
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
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Profile{name: $name}';
  }

}

class Subject {
  final int id;
  String category;
  String icon;
  int level;

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

  @override
  String toString() {
    return 'Lesson{category: $category, level: $level}';
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

  @override
  String toString() {
    return 'Unit{number: $number, name: $name, subject_id: $subjectID}';
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

  @override
  String toString() {
    return 'Lesson{number: $number, name: $name, unit_id: $unitID}';
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

    @override
    String toString() {
      return 'Progress{stars: $stars, fruits: $fruits, excellences: $excellences, currentUnit: $currentUnit, currentLesson: $currentLesson}';
    }
}
