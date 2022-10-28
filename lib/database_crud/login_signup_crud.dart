import 'package:iitpal_acharya_ui/models/acharya_user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class AcharyaUserDetailsCRUD {
  static final _databaseName = "iitpal_ekal_acharya.db";
  static final _databaseVersion = 1;

  static final tblAcharyaDetails = 'table_acharya_details';
  static final tbAllocatedContent = 'table_content_allocated';
  static final _tblAttendanceDetails = 'table_Attendance_details';
  static final _tblDateWiseAttendanceRecords = 'table_date_gat_wise';
  static final _tblContentDetails = 'table_content_details';
  static final _tblQuestionBank = 'table_question_bank';
  static final tblQuizAllocationScheduleDetails =
      'table_quiz_allocation_schedule';
  static final _tblQuizQuestionsCRUD = 'tblQuizQuestions';
  static final tblQuizOutcome = 'table_quiz_outcome';
  static final tblStudentDetails = 'table_student_details';
  static final tblVideoWatchedDetails = 'video_watched_details';
  static final tblAppUseDetails = 'app_use_details';
  static final _tblHolidayDetails = 'table_holiday_details';


  AcharyaUserDetailsCRUD._privateConstructor();

  static final AcharyaUserDetailsCRUD instance =
  AcharyaUserDetailsCRUD._privateConstructor();

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
        version: _databaseVersion, onCreate: _onCreate, onOpen: _onOpen);
  }

  // SQL code to create the database table
  Future _onOpen(Database db) async {
    if ((await db.query('sqlite_master',
        where: 'name = ?', whereArgs: [tblAcharyaDetails]))
        .isEmpty) {
      _onCreate(db, _databaseVersion);
    }
  }

  Future _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
          CREATE TABLE $tblAcharyaDetails (
            id TEXT UNIQUE PRIMARY KEY,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            password TEXT NOT NULL,
            mobileNumber TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL,
            schoolid TEXT NOT NULL,
            sanch_name TEXT NOT NULL,
            deviceUniqueId TEXT NOT NULL
          )
          ''');
    batch.execute('''
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
    batch.execute('''
          CREATE TABLE $_tblAttendanceDetails (
            id TEXT NOT NULL,
            date TEXT NOT NULL,
            Attendance TEXT NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL
          )
          ''');
    batch.execute('''
          CREATE TABLE $_tblDateWiseAttendanceRecords (
           date TEXT NOT NULL,
           gat TEXT NOT NULL,
           deviceUniqueId TEXT NOT NULL
          )
          ''');
    batch.execute('''
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
    batch.execute('''
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
    batch.execute('''
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
    batch.execute('''
          CREATE TABLE $_tblQuizQuestionsCRUD (
            quizID TEXT NOT NULL,
            questionID TEXT NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL
          )
          ''');
    batch.execute('''
          CREATE TABLE $tblQuizOutcome (
            studentID TEXT NOT NULL,
            quizID TEXT NOT NULL,
            docID TEXT NOT NULL,
            score INTEGER NOT NULL,
            maxMarks INTEGER NOT NULL,
            timeTaken INTEGER NOT NULL,
            deviceUniqueId TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL
          )
          ''');
    batch.execute('''
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
    batch.execute('''
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
    batch.execute('''
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

    batch.execute('''
     CREATE TABLE IF NOT EXISTS $tblAppUseDetails (
            deviceUniqueId TEXT UNIQUE PRIMARY KEY,
            appUseTime TEXT NOT NULL,
            synced TEXT NOT NULL,
            dateOfSync TEXT NOT NULL
            )
            ''');
    await batch.commit();
  }

  // Helper methods

  // Create
  Future<Map<String, dynamic>> insertNewAcharya(
      AcharyaUserDetails acharyaUserDetails) async {
    Database db = await instance.database;
    await db.insert(
        tblAcharyaDetails,
        {
          'id': acharyaUserDetails.id,
          'name': acharyaUserDetails.acharyaName,
          'email': acharyaUserDetails.acharyaEmail,
          'password': acharyaUserDetails.acharyaPassword,
          'mobileNumber': acharyaUserDetails.acharyaMobileNumber,
          'synced': acharyaUserDetails.synced,
          'dateOfSync': acharyaUserDetails.dateOfSync,
          'schoolid':acharyaUserDetails.schoolId,
          'sanch_name':acharyaUserDetails.sanch_name,
          'deviceUniqueId':acharyaUserDetails.deviceUniqueId
        },
        conflictAlgorithm: ConflictAlgorithm.ignore);
    return acharyaUserDetails.toMap();
  }

  // Retrieve
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    Database db = await instance.database;
    return await db.query(tblAcharyaDetails);
  }

  Future<List<Map<String, dynamic>>> getListOfAcaryasByFilter(
      String text) async {
    Database db = await instance.database;
    return await db
        .rawQuery("SELECT * FROM $tblAcharyaDetails WHERE name LIKE '%$text%'");
  }

  Future<List<Map<String, dynamic>>> getAcharyaById(String id) async {
    Database db = await instance.database;
    return await db.query(tblAcharyaDetails, where: "id = '$id'");
  }

  // Update
  Future<int> updateRowById(Map<String, dynamic> acharyaUserDetails) async {
    Database db = await instance.database;
    String id = acharyaUserDetails['id'];
    return await db.update(tblAcharyaDetails, acharyaUserDetails,
        where: 'id = ?', whereArgs: [id]);
  }

  // Delete
  Future<int> deleteAcharyaById(String id) async {
    Database db = await instance.database;
    return await db.delete(tblAcharyaDetails, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllAcharyas() async {
    Database db = await instance.database;
    return await db.delete(tblAcharyaDetails);
  }
}