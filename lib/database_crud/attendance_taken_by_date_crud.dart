import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import '../models/date_wise_attendance_record_model.dart';


class DateWiseAttendanceRecordsCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final _tblDateWiseAttendanceRecords = 'table_date_gat_wise';


  DateWiseAttendanceRecordsCRUD._privateConstructor();

  static final DateWiseAttendanceRecordsCRUD instance =
  DateWiseAttendanceRecordsCRUD._privateConstructor();

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
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_tblDateWiseAttendanceRecords (
            date TEXT NOT NULL,
            gat TEXT NOT NULL,
            deviceUniqueId TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Create
  Future<int> insertNewDateRecord(DateWiseRecord dateWiseRecord) async {
    Database db = await instance.database;
    return await db.insert(
        _tblDateWiseAttendanceRecords,
        {
          'date': dateWiseRecord.date,
          'gat': dateWiseRecord.gat,
          'deviceUniqueId':dateWiseRecord.deviceUniqueId
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<Map<String, dynamic>>> getRecordByDateAndGat(String gat,String date) async {
    Database? db = await instance.database;
    return await db.query(_tblDateWiseAttendanceRecords, where: "gat LIKE '$gat' AND date LIKE '%$date%'");
  }
  Future<List<Map<String, dynamic>>> getList() async {
    Database? db = await instance.database;
    return await db.query(_tblDateWiseAttendanceRecords);
  }
}