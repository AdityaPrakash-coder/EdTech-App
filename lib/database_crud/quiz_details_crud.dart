import 'dart:async';
import 'package:iitpal_acharya_ui/models/quiz_details_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class QuizQuestionsCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final tblQuizQuestionsCRUD = 'tblQuizQuestions';

  QuizQuestionsCRUD._privateConstructor();

  static final QuizQuestionsCRUD instance = QuizQuestionsCRUD._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tblQuizQuestionsCRUD (
            quizID TEXT NOT NULL,
            questionID TEXT NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Create
  Future<int> insertNewQuestion(QuizQuestions quizQuestions) async {
    Database db = await instance.database;
    return await db.insert(
        tblQuizQuestionsCRUD,
        {
          'quizID': quizQuestions.quizId,
          'questionID': quizQuestions.questionId,
          'deviceUniqueId': quizQuestions.deviceUniqueId,
          'synced': quizQuestions.synced,
          'dateOfSync': quizQuestions.dateOfSync,
        },
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<int> getlength() async {
    Database db = await instance.database;
    return (Sqflite.firstIntValue(await db.rawQuery('select count(*) from $tblQuizQuestionsCRUD')))!;
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    return await db.query(tblQuizQuestionsCRUD);
  }

  Future<List<Map<String, dynamic>>> GetQuestionIDbyQuizID(String quizID) async {
    Database db = await instance.database;
    return await db.rawQuery('SELECT * FROM $tblQuizQuestionsCRUD WHERE quizID = "$quizID"');
  }

  Future<List<QuizQuestions>> displayQuestions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tblQuizQuestionsCRUD);
    return List.generate(maps.length, (i) {
      return QuizQuestions(
        quizId: maps[i]['quizID'],
        questionId: maps[i]['questionID'],
        deviceUniqueId: maps[i]['deviceUniqueId'],
        synced: maps[i]['synced'],
        dateOfSync: maps[i]['dateOfSync'],
      );
    });
  }

  // Update
  Future<int> updateRowById(Map<String, dynamic> quizQuestions) async {
    Database db = await instance.database;
    String quizId = quizQuestions['quizID'];
    String questionId = quizQuestions['questionID'];
    return await db.update(tblQuizQuestionsCRUD, quizQuestions, where: "quizID = '$quizId' AND questionID = '$questionId'");
  }

  //Delete
  Future<int> deleteQuestionByQuestionId(String id) async {
    Database db = await instance.database;
    return await db.delete(tblQuizQuestionsCRUD, where: 'questionID = ?', whereArgs: [id]);
  }

  Future<int> deleteQuestionByQuizId(String id) async {
    Database db = await instance.database;
    return await db.delete(tblQuizQuestionsCRUD, where: 'quizID = ?', whereArgs: [id]);
  }

  Future<int> deleteAllQuestion() async {
    Database db = await instance.database;
    return await db.delete(tblQuizQuestionsCRUD);
  }
}
