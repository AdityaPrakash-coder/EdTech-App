import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import '../models/attendance_details_model.dart';

class AttendanceDetailsCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final _tblAttendanceDetails = 'table_Attendance_details';

  AttendanceDetailsCRUD._privateConstructor();

  static final AttendanceDetailsCRUD instance =
      AttendanceDetailsCRUD._privateConstructor();

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
          CREATE TABLE $_tblAttendanceDetails (
            id TEXT NOT NULL,
            date TEXT NOT NULL,
            Attendance TEXT NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Create
  Future<int> insertNewRecord(AttendanceDetails attendanceDetails) async {
    print('newRecordAdded');
    Database db = await instance.database;
    return await db.insert(
        _tblAttendanceDetails,
        {
          'id': attendanceDetails.id,
          'date': attendanceDetails.date,
          'Attendance': attendanceDetails.Attendance,
          'deviceUniqueId': attendanceDetails.deviceUniqueId,
          'synced': attendanceDetails.synced,
          'dateOfSync': attendanceDetails.dateOfSync,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    return await db.query(_tblAttendanceDetails);
  }

  Future<List<Map<String, dynamic>>> getAttendanceDetailsByDate(
      String date) async {
    Database db = await instance.database;
    return await db.query(_tblAttendanceDetails, where: "date LIKE '%$date'");
  }

  Future<List<Map<String, dynamic>>> getAttendanceDetailsByMonth(
      String month) async {
    Database db = await instance.database;
    return await db.query(_tblAttendanceDetails, where: "date LIKE '%-$month-%'");
  }

// Update
  Future<int> updateRowById(Map<String, dynamic> attendanceDetails) async {
    Database db = await instance.database;
    String id = attendanceDetails['id'];
    return await db.update(_tblAttendanceDetails, attendanceDetails,
        where: 'id = ?', whereArgs: [id]);
  }

// Delete
  Future<int> deleteStudentById(int id) async {
    Database db = await instance.database;
    return await db
        .delete(_tblAttendanceDetails, where: 'id = ?', whereArgs: [id]);
  }
}
