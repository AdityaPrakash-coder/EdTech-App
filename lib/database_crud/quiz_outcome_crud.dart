import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/quiz_outcome_model.dart';

class QuizOutcomeCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final tblQuizOutcome = 'table_quiz_outcome';

  QuizOutcomeCRUD._privateConstructor();

  static final QuizOutcomeCRUD instance = QuizOutcomeCRUD._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onOpen: _onOpen);
  }

  Future _onOpen(Database db) async {
    List temp = await db
        .query('sqlite_master', where: 'name = ?', whereArgs: [tblQuizOutcome]);
    if (temp.isEmpty) {
      _onCreate(db, _databaseVersion);
    }
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tblQuizOutcome (
            studentID TEXT NOT NULL,
            quizID TEXT NOT NULL,
            docID TEXT NOT NULL,
            score INTEGER NOT NULL,
            maxMarks INTEGER NOT NULL,
            timeTaken INTEGER NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Create
  Future<int> insertNewQuizOutcome(QuizOutcome quizOutcome) async {
    Database db = await instance.database;
    await _onOpen(db);
    return await db.insert(
        tblQuizOutcome,
        {
          'studentID': quizOutcome.studentID,
          'quizID': quizOutcome.quizID,
           'docID':quizOutcome.docID,
          'score': quizOutcome.score,
          'maxMarks': quizOutcome.maxMarks,
          'timeTaken': quizOutcome.timeTaken,
          'deviceUniqueId': quizOutcome.deviceUniqueId,
          'synced': quizOutcome.synced,
          'dateOfSync': quizOutcome.dateOfSync,
        },
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    await _onOpen(db);
    return await db.query(tblQuizOutcome);
  }

  // Future<List<QuizOutcome>> displayQuestions() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> maps = await db.query(tblQuizOutcome);
  //   return List.generate(maps.length, (i) {
  //     return QuizOutcome(
  //       studentID: maps[i]['studentID'],
  //       quizID: maps[i]['quizID'],
  //       score: maps[i]['score'],
  //       maxMarks: maps[i]['maxMarks'],
  //       timeTaken: maps[i]['timeTaken'],
  //       deviceUniqueId: maps[i]['deviceUniqueId'],
  //       synced: maps[i]['synced'],
  //       dateOfSync: maps[i]['dateOfSync'],
  //       docID:
  //     );
  //   });
  // }

  Future<List<Map<String, dynamic>>> getQuizOutcomeById(String id) async {
    Database? db = await instance.database;
    return await db.query(tblQuizOutcome, where: "studentID LIKE '$id'");
  }

  // Update
  Future<int> updateRowById(
      Map<String, dynamic> quizOutcome) async {
    Database db = await instance.database;
    String studentId = quizOutcome['studentID'];
    String quizId = quizOutcome['quizID'];
    return await db.update(
        tblQuizOutcome, quizOutcome,
        where: "studentID LIKE '$studentId' AND quizID LIKE '$quizId'");
  }

  Future<List<Map<String, dynamic>>> getQuizOutcomeByStudentAndQuizID(
      String studentId, String quizId) async {
    Database? db = await instance.database;
    return await db.query(tblQuizOutcome,
        where: "studentID LIKE '$studentId' AND quizID LIKE '$quizId'");
  }

// Delete
  Future<int> deleteQuestionById(String id) async {
    Database db = await instance.database;
    return await db.delete(tblQuizOutcome, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllQuestion() async {
    Database db = await instance.database;
    return await db.delete(tblQuizOutcome);
  }
}
