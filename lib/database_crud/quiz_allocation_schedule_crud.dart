import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import '../models/quiz_allocation_schedule_model.dart';

class QuizAllocationScheduleCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final tblQuizAllocationScheduleDetails =
      'table_quiz_allocation_schedule';

  QuizAllocationScheduleCRUD._privateConstructor();

  static final QuizAllocationScheduleCRUD instance =
      QuizAllocationScheduleCRUD._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onOpen: _onOpen);
  }

  Future _onOpen(Database db) async {
    if ((await db.query('sqlite_master',
            where: 'name = ?', whereArgs: [tblQuizAllocationScheduleDetails]))
        .isEmpty) {
      _onCreate(db);
    }
  }

  // SQL code to create the database table
  Future _onCreate(Database db) async {
    await db.execute('''
          CREATE TABLE $tblQuizAllocationScheduleDetails (
            id TEXT UNIQUE PRIMARY KEY,
            gat TEXT NOT NULL,
            date TEXT NOT NULL,
            time INTEGER NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Create
  Future<Map<String, dynamic>> allocateNewQuiz(
      QuizAllocationSchedule quizAllocationSchedule) async {
    Database db = await instance.database;
    await db.insert(
        tblQuizAllocationScheduleDetails,
        {
          'id': quizAllocationSchedule.quizId,
          'gat': quizAllocationSchedule.quizGat,
          'date': quizAllocationSchedule.quizDate,
          'time': quizAllocationSchedule.quizTime,
          'deviceUniqueId': quizAllocationSchedule.deviceUniqueId,
          'synced': quizAllocationSchedule.synced,
          'dateOfSync': quizAllocationSchedule.dateOfSync,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore);
    return quizAllocationSchedule.toMap();
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    return await db.query(tblQuizAllocationScheduleDetails);
  }
  Future<List<Map<String, dynamic>>> getAllocatedQuizByMonth(String month) async {
    Database db = await instance.database;
    return await db.query(tblQuizAllocationScheduleDetails, where: "date LIKE '%-$month-%'");
  }
  // Future<List<Map<String, dynamic>>> getListOfQuizAllocatedByFilter(String text) async {
  //   Database db = await instance.database;
  //   return await db.rawQuery("SELECT * FROM $tblQuizAllocationScheduleDetails WHERE name LIKE '%$text%'");
  // }

  Future<List<Map<String, dynamic>>> getAllocatedQuizById(String id) async {
    Database db = await instance.database;
    return await db.query(tblQuizAllocationScheduleDetails,
        where: "id = '$id'");
  }

  // Update
  Future<int> updateRowById(
      Map<String, dynamic> quizAllocationSchedule) async {
    Database db = await instance.database;
    String id = quizAllocationSchedule['id'];
    return await db.update(
        tblQuizAllocationScheduleDetails, quizAllocationSchedule,
        where: 'id = ?', whereArgs: [id]);
  }

  // Delete
  Future<int> deleteAllocatedQuizById(String id) async {
    Database db = await instance.database;
    return await db.delete(tblQuizAllocationScheduleDetails,
        where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllAllocatedQuizzes() async {
    Database db = await instance.database;
    return await db.delete(tblQuizAllocationScheduleDetails);
  }
}
