import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'models.dart';

class NajmeDatabase {
  dynamic database;

  Future<void> init() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'najme.db'),
      onCreate: (db, version) {
        db.execute(
          '''
            CREATE TABLE profiles(
              id INT PRIMARY KEY, 
              name TEXT, 
              gender TEXT,
              birthdate TEXT,
              level INT,
              city TEXT,
              ambition TEXT
            );
          ''',
        );
        db.execute(
            '''
              CREATE TABLE levels(
                id INT PRIMARY KEY,
                name TEXT
              )
            '''
        );
        db.execute(
            '''
              CREATE TABLE subjects(
              id INT PRIMARY KEY,
              category TEXT,
              icon TEXT,
              level INT
            );
            '''
        );
        db.execute(
            '''
              CREATE TABLE units(
              id INT PRIMARY KEY,
              number INT,
              name TEXT,
              icon TEXT,
              subject_id INT,
              FOREIGN KEY(subject_id) REFERENCES subjects(id)
            );
            '''
        );
        db.execute(
            '''
              CREATE TABLE lessons(
              id INT PRIMARY KEY,
              number INT,
              name TEXT,
              unit_id INT,
              FOREIGN KEY(unit_id) REFERENCES units(id)
            );
            '''
        );
        db.execute(
            '''
              CREATE TABLE progress(
              id INT PRIMARY KEY,
              stars INT,
              fruits INT,
              excellences INT,
              profile_id INT,
              subject_id INT,
              current_unit INT,
              current_lesson INT,
              FOREIGN KEY(profile_id) REFERENCES profiles(id)
            );
            '''
        );
      },
      version: 1,
    );
  }


  /* Inserting Into DB */ 

  Future<void> insertProfile(Profile profile) async {
    final db = await database;
    await db.insert(
      'profiles',
      profile.toMap(),
    );
  }

  Future<void> insertLevel(Level level) async {
    final db = await database;
    await db.insert(
      'levels',
      level.toMap(),
    );
  }

  Future<void> insertSubject(Subject subject) async {
    final db = await database;
    await db.insert(
      'subjects',
      subject.toMap(),
    );
  }

  Future<void> insertUnit(Unit unit) async {
    final db = await database;
    await db.insert(
      'units',
      unit.toMap(),
    );
  }

  Future<void> insertLesson(Lesson lesson) async {
    final db = await database;
    await db.insert(
      'lessons',
      lesson.toMap(),
    );
  }

  Future<void> insertProgress(Progress progress) async {
    final db = await database;
    await db.insert(
      'progress',
      progress.toMap(),
    );
  }


  /* Updating Records */

  Future<void> updateProfile(Profile profile) async {
    final db = await database;
    await db.update(
      'profile',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  Future<void> updateProgress(Progress progress) async {
    final db = await database;
    await db.update(
      'progress',
      progress.toMap(),
      where: 'id = ?',
      whereArgs: [progress.id],
    );
  }

  /* Getting From DB */


  Future<Profile> getProfile(int profileID) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'profiles',
      where: "id = ?",
      whereArgs: [profileID],
    );

    return Profile(
      id: maps[0]['id'],
      name: maps[0]['name'],
      gender: maps[0]["gender"],
      birthdate: maps[0]["birthdate"],
      level: maps[0]["level"],
      city: maps[0]["city"],
      ambition: maps[0]["ambition"],
    );
  }

  Future<List<Profile>> getProfiles() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'profiles',
    );

    return List.generate(maps.length, (i) {
      return Profile(
        id: maps[i]['id'],
        name: maps[i]['name'],
        gender: maps[i]['gender'],
        birthdate: maps[i]['birthdate'],
        level: maps[i]['level'],
        city: maps[i]['city'],
        ambition: maps[i]['ambition'],
      );
    });
  }

  Future<List<Subject>> getSubjects(int profileID) async {
    final db = await database;

    final Profile profile = await getProfile(profileID);

    final List<Map<String, dynamic>> maps = await db.query(
      'subjects',
      where: "level = ?",
      whereArgs: [profile.level],
    );

    return List.generate(maps.length, (i) {
      return Subject(
        id: maps[i]['id'],
        category: maps[i]['category'],
        icon: maps[i]['icon'],
        level: maps[i]['level'],
      );
    });
  }

  Future<List<Unit>> getUnits(int subjectID) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'units',
      where: "subject_id = ?",
      whereArgs: [subjectID],
    );

    return List.generate(maps.length, (i) {
      return Unit(
        id: maps[i]['id'],
        number: maps[i]['number'],
        name: maps[i]['name'],
        icon: maps[i]['icon'],
        subjectID: maps[i]['subject_id'],
      );
    });
  }

  Future<List<Lesson>> getLessons(int unitID) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'lessons',
      where: "unit_id = ?",
      whereArgs: [unitID],
    );

    return List.generate(maps.length, (i) {
      return Lesson(
        id: maps[i]['id'],
        number: maps[i]['number'],
        name: maps[i]['name'],
        unitID: maps[i]['unit_id'],
      );
    });
  }

  Future<Progress> getProgress(int profileID) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'progress',
      where: "profile_id = ?",
      whereArgs: [profileID],
    );

    return Progress(
      id: maps[0]['id'],
      stars: maps[0]['stars'],
      fruits: maps[0]['fruits'],
      excellences: maps[0]['excellences'],
      currentUnit: maps[0]['current_unit'],
      currentLesson: maps[0]['current_lesson'],
      profileId: maps[0]['profile_id'],
      subjectId: maps[0]['subject_id'],
    );

  }

  /* Deleting */


  Future<void> deleteAll() async {
    final db = await database;
    await db.delete(
    'profile'
    );

    await db.delete(
    'unit'
    );

    await db.delete(
    'lesson'
    );

    await db.delete(
    'subject'
    );

    await db.delete(
    'progress'
    );
  }
}
