import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'models.dart';

class Database {
  dynamic database;

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      join(await getDatabasesPath(), 'najme.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
            CREATE TABLE profiles(
              id INT PRIMARY KEY, 
              name TEXT, 
              gender bool,
              birthdate Date,
              level INT,
              city INT,
              ambition INT,
            );
            CREATE TABLE subjects(
              id INT PRIMARY KEY,
              category TEXT,
              icon TEXT,
              level INT,
            );
            CREATE TABLE units(
              id INT PRIMARY KEY,
              number INT,
              name TEXT,
              icon TEXT,
              subject_id INT,
              FOREIGN KEY(subject_id) REFERENCES subjects(id),
            );
            CREATE TABLE lessons(
              id INT PRIMARY KEY,
              number INT,
              name TEXT,
              unit_id INT,
              FOREIGN KEY(unit_id) REFERENCES units(id),
            );
            CREATE TABLE progess(
              id INT PRIMARY KEY,
              stars INT,
              fruits INT,
              excellences INT,
              profile_id INT,
              FOREIGN KEY(profile_id) REFERENCES profiles(id),
            );
            CREATE TABLE currents(
              progress_id INT,
              subject_id INT,
              current INT,
              FOREIGN KEY(progress_id) REFERENCES progress(id),
              FOREIGN KEY(subject_id) REFERENCES subjects(id),
              PRIMARY KEY(progress_id, subject_id),
            );
          ''',
        );
      },
      version: 1,
    );
  }


  /* Inserting Into DB */ 


  // should be changed
  Future<void> insertProgress(int profileID) async {
    final db = await database;

    Map<String, dynamic> progressMap = {
      'stars': 0, 
      'fruits': 0, 
      'excellences': 0, 
      'profileID': profileID,
    };

    await db.insert(
      'progress',
      progressMap,
    );

    progressMap = await db.query(
      'progress',
      where: "profile_id = ?",
      whereArgs: [profileID],
    )[0];

    List<Subject> subjects = await getSubjects(profileID);
    
    for (int i = 0; i < subjects.length; i++) {
      Map<String, dynamic> current = {
        'progress_id': progressMap["id"],
        'subject_id': subjects[i].id,
        'current': 0,
      };

      await db.insert(
        'currents',
        current,
      );
    }
  }


  Future<void> insertProfile(Profile profile) async {

  }

  Future<void> insertLesson(Lesson lesson) async {
    
  }

  Future<void> insertUnit(Unit unit) async {
    
  }

  Future<void> insertSubject(Subject subject) async {

  }


  /* Updating Records */


  Future<void> updateProgress(Progress progress) async {
    final db = await database;

    await db.update(
      'progress',
      progress.toMap(),
      where: 'id = ?',
      whereArgs: [progress.id],
    );

    progress.currents.forEach((subjectID, value) async {
      await db.rawUpdate(
        'UPDATE currents SET current = ? WHERE progress_id = ? AND subject_id = ?',
        [value, progress.id, subjectID]
      );
    });
  }


  Future<void> updateProfile(Profile profile) async {
    
  }


  /* Getting From DB */


  Future<Progress> getProgress(int profileID) async {
    final db = await database;

    final List<Map<String, dynamic>> progressMaps = await db.query(
      'progress',
      where: "profile_id = ?",
      whereArgs: [profileID],
    );

    final List<Map<String, dynamic>> currentsMaps = await db.query(
      'currents',
      where: "progress_id = ?",
      whereArgs: [progressMaps[0]["id"]],
    );

    Map<int, int> currents = {};
    for (int i = 0; i < currentsMaps.length; i++) {
      currents[currentsMaps[i]["subject_id"]] = currentsMaps[i]["current"];
    }

    return Progress(
      id: progressMaps[0]["id"], 
      stars: progressMaps[0]["stars"], 
      fruits: progressMaps[0]["fruits"], 
      excellences: progressMaps[0]["excellences"], 
      currents: currents, 
      profileID: profileID,
    );
  }


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


  /* Deleting */


  Future<void> deleteAll() async {

  }
}
