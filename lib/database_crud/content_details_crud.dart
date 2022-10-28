import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/content_details_model.dart';

class ContentDetailsCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final _tblContentDetails = 'table_content_details';

  ContentDetailsCRUD._privateConstructor();

  static final ContentDetailsCRUD instance =
  ContentDetailsCRUD._privateConstructor();

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
        version: _databaseVersion, onOpen: _onOpen);
  }

  Future _onOpen(Database db) async {
    List temp = await db.query('sqlite_master', where: 'name = ?', whereArgs: [_tblContentDetails]);
    if (temp.isEmpty) {
      _onCreate (db);
    }
  }
  // SQL code to create the database table
  Future _onCreate(Database db) async {
    await db.execute('''
          CREATE TABLE $_tblContentDetails (
            id TEXT UNIQUE PRIMARY KEY,
            name TEXT NOT NULL,
            gat TEXT NOT NULL,
            sub TEXT NOT NULL,
            topic TEXT NOT NULL,
            version TEXT NOT NULL,
            dateOfLastModification TEXT NOT NULL,
            path TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Create
  Future<int> insertNewContent(ContentDetails contentDetails) async {
    Database db = await instance.database;
    return await db.insert(
        _tblContentDetails,
        {
          'id': contentDetails.id,
          'name': contentDetails.videoName,
          'gat':contentDetails.gat,
          'sub': contentDetails.subject,
          'topic': contentDetails.topic,
          'version': contentDetails.version,
          'dateOfLastModification': contentDetails.dateOfLastModification,
          'path': contentDetails.videoPath
        },
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    return await db.query(_tblContentDetails);
  }

  Future<List<Map<String, dynamic>>> getVideoById(String id) async {
    Database db = await instance.database;
    return await db.query(_tblContentDetails, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getVideosByGat(String gat) async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM $_tblContentDetails WHERE gat LIKE '$gat'");
  }

  Future<List<Map<String, dynamic>>> getVideosByGatSubject(String gat, String subject) async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM $_tblContentDetails WHERE gat LIKE '$gat' AND topic LIKE '$subject'");
  }

  Future<List<Map<String, dynamic>>> getVideosByGatSubjectTopic(String gat, String subject, String topic) async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM $_tblContentDetails WHERE gat LIKE '$gat' AND sub LIKE '$subject' AND topic LIKE '$topic'");
  }

  // Update
  Future<int> updateRowById(Map<String, dynamic> contentDetails) async {
    Database db = await instance.database;
    String id = contentDetails['id'];
    return await db.update(_tblContentDetails, contentDetails, where: 'id = ?', whereArgs: [id]);
  }

  // Delete
  Future<int> deleteVideoById(String id) async {
    Database db = await instance.database;
    return await db.delete(_tblContentDetails, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllVideo() async {
    Database db = await instance.database;
    return await db.delete(_tblContentDetails);
  }
}