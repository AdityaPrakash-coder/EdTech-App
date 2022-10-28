import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import '../models/allocated_content_model.dart';

class AllocatedContentCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 2;

  static final tbAllocatedContent = 'table_content_allocated';

  AllocatedContentCRUD._privateConstructor();

  static final AllocatedContentCRUD instance = AllocatedContentCRUD._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate, onOpen: _onOpen);
  }

  // SQL code to create the database
  void _onOpen(Database db) async {
    if ((await db.query('sqlite_master', where: 'name = ?', whereArgs: [tbAllocatedContent])).isEmpty) {
      _onCreate(db, _databaseVersion);
    }
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tbAllocatedContent (
            id TEXT UNIQUE PRIMARY KEY,
            contentName TEXT NOT NULL,
            contentGat TEXT NOT NULL,
            contentSubject TEXT NOT NULL,
            contentTopic TEXT NOT NULL,
            time TEXT NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL,
            docId TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Create
  Future<Map<String, dynamic>> insertNewContent(AllocatedContent allocatedContent) async {
    Database db = await instance.database;
    await db.insert(
        tbAllocatedContent,
        {
          'id': allocatedContent.id,
          'contentName': allocatedContent.contentName,
          'contentGat': allocatedContent.contentGat,
          'contentSubject': allocatedContent.contentSubject,
          'contentTopic': allocatedContent.contentTopic,
          'time': allocatedContent.time,
          'deviceUniqueId': allocatedContent.deviceUniqueId,
          'synced': allocatedContent.synced,
          'dateOfSync': allocatedContent.dateOfSync,
          'docId':allocatedContent.docId
        },
        conflictAlgorithm: ConflictAlgorithm.ignore);
    return allocatedContent.toMap();
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    return await db.query(tbAllocatedContent);
  }

  Future<List<Map<String, dynamic>>> getAllocatedContentByGatAndDate(String gat, String date) async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM $tbAllocatedContent WHERE contentGat = '$gat' AND time LIKE '$date'");
  }

  Future<List<Map<String, dynamic>>> getAllocatedContentByDate(String date) async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM $tbAllocatedContent WHERE time LIKE '$date'");
  }

  Future<List<Map<String, dynamic>>> getAllocatedContentByGatAndMonth(String gat, String month) async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM $tbAllocatedContent WHERE contentGat = '$gat' AND time LIKE '%-$month-%'");
  }

  Future<List<Map<String, dynamic>>> getAllocatedContentByGat(String gat) async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM $tbAllocatedContent WHERE contentGat = '$gat'");
  }

  Future<List<Map<String, dynamic>>> getAllocatedContentById(String id) async {
    Database db = await instance.database;
    return await db.query(tbAllocatedContent, where: 'id = ?', whereArgs: [id]);
  }

  // Update
  Future<int> updateRowById(Map<String, dynamic> allocatedContent) async {
    Database db = await instance.database;
    String id = allocatedContent['id'];
    return await db.update(tbAllocatedContent, allocatedContent, where: 'id = ?', whereArgs: [id]);
  }

  // Delete
  Future<int> deleteAllocatedContentById(String id) async {
    Database db = await instance.database;
    return await db.delete(tbAllocatedContent, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllAllocatedContent() async {
    Database db = await instance.database;
    return await db.delete(tbAllocatedContent);
  }
}
