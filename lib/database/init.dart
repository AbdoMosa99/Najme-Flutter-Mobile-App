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
            )
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

    return Profile.fromMap(maps[0]);
  }

  Future<List<Profile>> getProfiles() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'profiles',
    );

    return List.generate(maps.length, (i) {
      return Profile.fromMap(maps[i]);
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
      return Subject.fromMap(maps[i]);
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
      return Unit.fromMap(maps[i]);
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
      return Lesson.fromMap(maps[i]);
    });
  }

  Future<Progress> getProgress(int profileID) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'progress',
      where: "profile_id = ?",
      whereArgs: [profileID],
    );

    return Progress.fromMap(maps[0]);

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
