import 'package:iitpal_acharya_ui/models/student_details_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class StudentDetailsCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final tblStudentDetails = 'table_student_details';

  StudentDetailsCRUD._privateConstructor();

  static final StudentDetailsCRUD instance =
      StudentDetailsCRUD._privateConstructor();

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
        version: _databaseVersion, onOpen: _onOpen, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onOpen(Database db) async {
    if ((await db.query('sqlite_master',
            where: 'name = ?', whereArgs: [tblStudentDetails]))
        .isEmpty) {
      _onCreate(db, _databaseVersion);
    }
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE IF NOT EXISTS $tblStudentDetails (
            id TEXT UNIQUE PRIMARY KEY,
            name TEXT NOT NULL,
            gat TEXT NOT NULL,
            age INTEGER NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            synced TEXT NULL,
            dateOfSync TEXT NULL
          )
          ''');
  }

  // Helper methods

  // Create
  Future<Map<String, dynamic>> insertNewStudent(
      StudentDetails studentDetails) async {
    Database db = await instance.database;
    await db.insert(
        tblStudentDetails,
        {
          'id': studentDetails.id,
          'name': studentDetails.studentName,
          'gat': studentDetails.studentGat,
          'age': studentDetails.studentAge,
          'deviceUniqueId': studentDetails.deviceUniqueId,
          'synced': studentDetails.synced,
          'dateOfSync': studentDetails.dateOfSync,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore);
    return studentDetails.toMap();
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    return await db.query(tblStudentDetails);
  }

  Future<List<Map<String, dynamic>>> getAllRowsListByFilter(
      String text) async {
    Database db = await instance.database;
    return await db
        .rawQuery("SELECT * FROM $tblStudentDetails WHERE name LIKE '%$text%'");
  }

  Future<List<Map<String, dynamic>>> getStudentById(String id) async {
    Database db = await instance.database;
    return await db.query(tblStudentDetails, where: "id LIKE '$id'");
  }

  Future<List<Map<String, dynamic>>> getStudentByGat(String gat) async {
    Database db = await instance.database;
    return await db.query(tblStudentDetails, where: "gat LIKE '$gat'");
  }

  // Update
  Future<int> updateRowById(Map<String, dynamic> studentDetails) async {
    Database db = await instance.database;
    String id = studentDetails['id'];
    return await db.update(tblStudentDetails, studentDetails,
        where: 'id = ?', whereArgs: [id]);
  }

  // Delete
  Future<int> deleteStudentById(String id) async {
    Database db = await instance.database;
    return await db.delete(tblStudentDetails, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllStudents() async {
    Database db = await instance.database;
    return await db.delete(tblStudentDetails);
  }

  Future<bool> check_student_login(String gat) async {
    Database db = await instance.database;
    var res = await db
        .rawQuery("SELECT * FROM $tblStudentDetails WHERE gat = '$gat'");

    if (res.length > 0) {
      return true;
    }
    return false;
  }
}
