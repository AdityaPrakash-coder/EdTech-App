import 'package:iitpal_acharya_ui/models/app_usages_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class AppUseCrudCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final tblAppUseDetails = 'app_use_details';

  AppUseCrudCRUD._privateConstructor();

  static final AppUseCrudCRUD instance =
  AppUseCrudCRUD._privateConstructor();

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
        where: 'name = ?', whereArgs: [tblAppUseDetails]))
        .isEmpty) {
      _onCreate(db, _databaseVersion);
    }
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE IF NOT EXISTS $tblAppUseDetails (
            deviceUniqueId TEXT UNIQUE PRIMARY KEY,
            appUseTime TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Create
  Future<Map<String, dynamic>> insertNewRaw(
      AppUseDetails appUseDetails) async {
    Database db = await instance.database;
    await db.insert(
        tblAppUseDetails,
        {
          'deviceUniqueId': appUseDetails.deviceUniqueId,
          'appUseTime': appUseDetails.appUseTime,
          'synced': appUseDetails.dateOfSync,
          'dateOfSync': appUseDetails.dateOfSync,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore);
    return appUseDetails.toMap();
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    return await db.query(tblAppUseDetails);
  }

  Future<List<Map<String, dynamic>>> getAllRowsListByFilter(
      String text) async {
    Database db = await instance.database;
    return await db
        .rawQuery("SELECT * FROM $tblAppUseDetails WHERE deviceUniqueId LIKE '%$text%'");
  }


  // Update
  Future<int> updateRowById(AppUseDetails appUseDetails) async {
    Database db = await instance.database;
    String id = appUseDetails.deviceUniqueId!;
    return await db.update(tblAppUseDetails, appUseDetails.toMap(),
        where: 'deviceUniqueId = ?', whereArgs: [id]);
  }
  Future<int> updateRowByIdtoFirebase(Map<String, dynamic> appUseDetails) async {
    Database db = await instance.database;
    String id = appUseDetails["deviceUniqueId"];
    return await db.update(tblAppUseDetails, appUseDetails,
        where: 'deviceUniqueId = ?', whereArgs: [id]);
  }

  // Delete
  Future<int> deleteStudentById(String id) async {
    Database db = await instance.database;
    return await db.delete(tblAppUseDetails, where: 'deviceUniqueId = ?', whereArgs: [id]);
  }

  Future<int> deleteAllRows() async {
    Database db = await instance.database;
    return await db.delete(tblAppUseDetails);
  }

}
