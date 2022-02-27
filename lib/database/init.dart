import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'models.dart';

class NajmeDatabase {
  dynamic database;

  Future<void> open() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'najme.db'),
      onCreate: (db, version) {
        db.execute(
          '''
            CREATE TABLE profiles(
              id INT PRIMARY KEY, 
              name TEXT, 
              gender TEXT,
              birthdate TEXT,
              level TEXT,
              city TEXT,
              ambition TEXT
            )
          ''',
        );
        db.execute(
          '''
            CREATE TABLE levels(
              name TEXT PRIMARY KEY
            )
          '''
        );
        db.execute(
            '''
              CREATE TABLE subjects(
                id INT PRIMARY KEY,
                category TEXT,
                icon TEXT,
                level TEXT
              )
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
              )
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
            )
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
            )
            '''
        );
      },
      version: 1,
    );
  }


  /* Inserting Into DB */ 

  Future<void> insertProfile(Profile profile) async {
    await database.insert(
      'profiles',
      profile.toMap(),
    );
  }


  Future<void> insertLevel(String level) async {
    await database.insert(
      'levels',
      {"name": level},
    );
  }


  Future<void> insertSubject(Subject subject) async {
    await database.insert(
      'subjects',
      subject.toMap(),
    );
  }


  Future<void> insertUnit(Unit unit) async {
    await database.insert(
      'units',
      unit.toMap(),
    );
  }


  Future<void> insertLesson(Lesson lesson) async {
    await database.insert(
      'lessons',
      lesson.toMap(),
    );
  }


  Future<void> insertProgress(Progress progress) async {
    await database.insert(
      'progress',
      progress.toMap(),
    );
  }


  /* Updating Records */

  Future<void> updateProfile(Profile profile) async {
    await database.update(
      'profiles',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }


  Future<void> updateProgress(Progress progress) async {
    await database.update(
      'progress',
      progress.toMap(),
      where: 'id = ?',
      whereArgs: [progress.id],
    );
  }

  /* Getting From database */


  Future<Profile> getProfile(int profileID) async {
    List<Map<String, dynamic>> maps = await database.query(
      'profiles',
      where: "id = ?",
      whereArgs: [profileID],
    );


    return Profile.fromMap(maps[0]);
  }


  Future<List<Profile>> getProfiles() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'profiles',
    );

    return List.generate(maps.length, (i) {
      return Profile.fromMap(maps[i]);
    });
  }


  Future<List<Subject>> getSubjects(int profileID) async {
    final Profile profile = await getProfile(profileID);

    final List<Map<String, dynamic>> maps = await database.query(
      'subjects',
      where: "level = ?",
      whereArgs: [profile.level],
    );

    return List.generate(maps.length, (i) {
      return Subject.fromMap(maps[i]);
    });
  }

  Future<List<Unit>> getUnits(int subjectID) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'units',
      where: "subject_id = ?",
      whereArgs: [subjectID],
    );

    return List.generate(maps.length, (i) {
      return Unit.fromMap(maps[i]);
    });
  }

  Future<List<Lesson>> getLessons(int unitID) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'lessons',
      where: "unit_id = ?",
      whereArgs: [unitID],
    );

    return List.generate(maps.length, (i) {
      return Lesson.fromMap(maps[i]);
    });
  }

  Future<List<Progress>> getProgress(int profileID) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'progress',
      where: "profile_id = ?",
      whereArgs: [profileID],
    );

    return List.generate(maps.length, (i) {
      return Progress.fromMap(maps[i]);
    });
  }

  Future<List<String>> getLevels() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'levels',
    );

    return List.generate(maps.length, (i) {
      return maps[i]['name'];
    });
  }


  /* Deleting */

  Future<void> deleteAll() async {
    await database.delete(
    'profile'
    );

    await database.delete(
    'unit'
    );

    await database.delete(
    'lesson'
    );

    await database.delete(
    'subject'
    );

    await database.delete(
    'progress'
    );
  }
}
