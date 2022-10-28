import 'dart:async';
import 'package:iitpal_acharya_ui/models/holiday_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/content_details_model.dart';

class HolidayDetailsCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final _tblHolidayDetails = 'table_holiday_details';

  HolidayDetailsCRUD._privateConstructor();

  static final HolidayDetailsCRUD instance =
  HolidayDetailsCRUD._privateConstructor();

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
    List temp = await db.query('sqlite_master', where: 'name = ?', whereArgs: [_tblHolidayDetails]);
    if (temp.isEmpty) {
      _onCreate (db);
    }
  }
  // SQL code to create the database table
  Future _onCreate(Database db) async {
    await db.execute('''
          CREATE TABLE $_tblHolidayDetails (
            id TEXT UNIQUE PRIMARY KEY,
            date TEXT NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            remark TEXT NOT NULL,
            gat TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSynced TEXT NOT NULL
           
          )
          ''');
  }

  // Helper methods

  // Create
  Future<int> insertNewContent(HolidayDetails holidayDetails) async {
    Database db = await instance.database;
    return await db.insert(
        _tblHolidayDetails,
        {
          'id': holidayDetails.id,
          'date': holidayDetails.dateOfHoliday,
          'deviceUniqueId': holidayDetails.deviceUniqueId,
          'remark':holidayDetails.remark,
          'gat':holidayDetails.gat,
          'synced':holidayDetails.synced,
          'dateOfSynced':holidayDetails.dateOfSynced
        },
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    return await db.query(_tblHolidayDetails);
  }

  Future<List<Map<String, dynamic>>> getVideoById(String id) async {
    Database db = await instance.database;
    return await db.query(_tblHolidayDetails, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getHolidayDetailsByDate(String date) async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM $_tblHolidayDetails WHERE date LIKE '$date'");
  }
  // Update
  Future<int> updateRowById(Map<String, dynamic> contentDetails) async {
    Database db = await instance.database;
    String id = contentDetails['id'];
    return await db.update(_tblHolidayDetails, contentDetails, where: 'id = ?', whereArgs: [id]);
  }

  // Delete
  Future<int> deleteVideoById(String id) async {
    Database db = await instance.database;
    return await db.delete(_tblHolidayDetails, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllVideo() async {
    Database db = await instance.database;
    return await db.delete(_tblHolidayDetails);
  }
}