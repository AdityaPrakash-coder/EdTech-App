import 'package:iitpal_acharya_ui/models/video_watched_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class VideoWatchedCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final tblVideoWatchedDetails = 'video_watched_details';

  VideoWatchedCRUD._privateConstructor();

  static final VideoWatchedCRUD instance =
  VideoWatchedCRUD._privateConstructor();

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
          CREATE TABLE $tblVideoWatchedDetails (
            id TEXT UNIQUE PRIMARY KEY,
            Gat TEXT NOT NULL,
            Subject TEXT NOT NULL,
            Topic TEXT NOT NULL,
            totalWatchedTime TEXT NOT NULL,
            total_video_length TEXT NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL
          )
          ''');
  }

  // Helper methods

  // Create
  Future<Map<String, dynamic>> insertNewRaw(
      VideoWatchedDetails videoWatchedDetails) async {
    Database db = await instance.database;
    await db.insert(
        tblVideoWatchedDetails,
        { 'id':videoWatchedDetails.id,
          'Gat': videoWatchedDetails.Gat,
          'Subject': videoWatchedDetails.Subject,
          'Topic': videoWatchedDetails.Topic,
          'totalWatchedTime':videoWatchedDetails.totalWatchedTime,
          'total_video_length':videoWatchedDetails.total_video_length,
          'deviceUniqueId': videoWatchedDetails.deviceUniqueId,
          'synced': videoWatchedDetails.synced,
          'dateOfSync': videoWatchedDetails.dateOfSync,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    return videoWatchedDetails.toMap();
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    return await db.query(tblVideoWatchedDetails);
  }
/*Future<List<Map<String, dynamic>>> getAllRowsListByFilter(String text) async {
    Database db = awai
t instance.database;
    return await db.rawQuery("SELECT * FROM $tblStudentDetails WHERE name LIKE '%$text%'");
  }
*/
  Future<List<Map<String, dynamic>>> getVideoWatchedByVideoId(String id) async {
    Database db = await instance.database;
    return await db.query(tblVideoWatchedDetails, where: "id LIKE '%$id%'");

  }
  Future<List<Map<String, dynamic>>> getVideoWatchedByGat(String gat) async {
    Database db = await instance.database;
    return await db.query(tblVideoWatchedDetails, where: "Gat LIKE '$gat'");
  }

  // Update

  Future<int> updateRowById(Map<String, dynamic> videoWatchedDetails) async {
    Database db = await instance.database;
    String id = videoWatchedDetails['id'];
    return await db.update(tblVideoWatchedDetails, videoWatchedDetails,
        where: 'id = ?', whereArgs: [id]);
  }
  // Delete
  Future<int> deleteVideoWatchedBYVideoIdId(String id) async {
    Database db = await instance.database;
    return await db
        .delete(tblVideoWatchedDetails, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllWatchedData() async {
    Database db = await instance.database;
    return await db.delete(tblVideoWatchedDetails);
  }
}