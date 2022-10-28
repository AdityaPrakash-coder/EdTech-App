import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/question_model.dart';

class QuestionBankCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final _tblQuestionBank = 'table_question_bank';

  QuestionBankCRUD._privateConstructor();

  static final QuestionBankCRUD instance =
      QuestionBankCRUD._privateConstructor();

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
    List temp = await db.query('sqlite_master',
        where: 'name = ?', whereArgs: [_tblQuestionBank]);
    if (temp.isEmpty) {
      _onCreate(db);
    }
  }

  // SQL code to create the database table
  Future _onCreate(Database db) async {
    await db.execute('''
          CREATE TABLE $_tblQuestionBank (
            id TEXT UNIQUE PRIMARY KEY,
            gat TEXT NOT NULL,
            sub TEXT NOT NULL,
            topic TEXT NOT NULL,
            question TEXT NOT NULL,
            a TEXT NOT NULL,
            b TEXT NOT NULL,
            c TEXT NOT NULL,
            d TEXT NOT NULL,
            ans TEXT NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Create
  Future<int> insertNewQuestion(QuestionDetails questionDetails) async {
    Database db = await instance.database;
    return await db.insert(
        _tblQuestionBank,
        {
          'id': questionDetails.id,
          'gat': questionDetails.questionGat,
          'sub': questionDetails.questionSubject,
          'topic': questionDetails.questionTopic,
          'question': questionDetails.question,
          'a': questionDetails.a,
          'b': questionDetails.b,
          'c': questionDetails.c,
          'd': questionDetails.d,
          'ans': questionDetails.answer,
          'deviceUniqueId': questionDetails.deviceUniqueId,
          'synced': questionDetails.synced,
          'dateOfSync': questionDetails.dateOfSync,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> getlength() async {
    Database db = await instance.database;
    return (Sqflite.firstIntValue(
        await db.rawQuery('select count(*) from $_tblQuestionBank')))!;
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    return await db.query(_tblQuestionBank);
  }

  Future<List<QuestionDetails>> displayQuestions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tblQuestionBank);
    return List.generate(maps.length, (i) {
      return QuestionDetails(
        id: maps[i]['id'],
        questionGat: maps[i]['gat'],
        questionSubject: maps[i]['sub'],
        questionTopic: maps[i]['topic'],
        question: maps[i]['question'],
        a: maps[i]['a'],
        b: maps[i]['b'],
        c: maps[i]['c'],
        d: maps[i]['d'],
        answer: maps[i]['ans'],
        deviceUniqueId: maps[i]['deviceUniqueId'],
        synced: maps[i]['synced'],
        dateOfSync: maps[i]['dateOfSync'],
      );
    });
  }

  Future<List<Map<String, dynamic>>> getQuestionByGat(String gat) async {
    Database db = await instance.database;
    return await db
        .rawQuery("SELECT * FROM $_tblQuestionBank WHERE gat LIKE '$gat'");
  }

  Future<List<Map<String, dynamic>>> getQuestionById(String id) async {
    Database db = await instance.database;
    return await db.query(_tblQuestionBank, where: "id= ?", whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getQuestionByGatTopic(
      String gat, String topic) async {
    Database db = await instance.database;
    return await db.rawQuery(
        "SELECT * FROM $_tblQuestionBank WHERE gat LIKE '$gat' AND topic LIKE '$topic'");
  }

  Future<List<Map<String, dynamic>>> getQuestionByGatSubjectTopic(
      String gat, String subject, String topic) async {
    Database db = await instance.database;
    return await db.rawQuery(
        "SELECT * FROM $_tblQuestionBank WHERE gat LIKE '$gat%' AND sub LIKE '$subject' AND topic LIKE '$topic'");
  }

  //Update
  Future<int> updateRowById(Map<String, dynamic> questionDetails) async {
  Database db = await instance.database;
   String id = questionDetails['id'];
   return await db.update(_tblQuestionBank, questionDetails,
    where: 'id = ?', whereArgs: [id]);
   }

  // Delete
  // Future<int> deleteQuestionById(String id) async {
  //   Database db = await instance.database;
  //   return await db.delete(_tblQuestionBank, where: 'id = ?', whereArgs: [id]);
  // }

  // Future<int> deleteAllQuestion() async {
  //   Database db = await instance.database;
  //   return await db.delete(_tblQuestionBank);
  // }
}
