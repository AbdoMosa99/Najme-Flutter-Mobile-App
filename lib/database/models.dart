
class Profile {
  final int id;
  final String name;
  final bool gender;
  final DateTime birthdate;
  final int level;
  final int city;
  final int ambition;

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
      'birthdate': birthdate,
      'level': level,
      'city': city,
      'ambition': ambition,
    };
  }

  @override
  String toString() {
    return 'Profile{name: $name, level: $level, city: $city}';
  }
}

class Progress {
  final int id;
  final int stars;
  final int fruits;
  final int excellences;
  final Map<int, int> currents; // should contain unit and lesson for each subject
  final int profileID;

  Progress({
    required this.id,
    required this.stars,
    required this.fruits,
    required this.excellences,
    required this.currents,
    required this.profileID,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stars': stars,
      'fruits': fruits,
      'excellences': excellences,
      'profile_id': profileID,
    };
  }

    @override
    String toString() {
      return 'Progress{stars: $stars, fruits: $fruits, excellences: $excellences, currents: $currents}';
    }
}

class Subject {
  final int id;
  final String category;
  final String icon;
  final int level;

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
  final int number;
  final String name;
  final String icon;
  final int subjectID;

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


// shalow
class Lesson {
  final int id;
  final int number;
  final String name;
  final int unitID;

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
