import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:iitpal_acharya_ui/database_crud/allocated_content_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/attendance_details_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/holiday_database.dart';
import 'package:iitpal_acharya_ui/database_crud/question_bank_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_allocation_schedule_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_details_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_outcome_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/student_details_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/video_watched_crud.dart';
import '../../constants/integer_constants.dart';
import '../../constants/theme_colors.dart';
import '../../database_crud/login_signup_crud.dart';
import 'package:http/http.dart' as http;

class SyncPage extends StatefulWidget {
  @override
  SyncPageState createState() => SyncPageState();
}

class SyncPageState extends State<SyncPage> {

  // Variables
  String syncStatus = "syncing";
  Map<String, Widget> mapOfWidgets = {
    "syncing": Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LinearProgressIndicator(
          backgroundColor: Colors.lightBlueAccent[100],
          minHeight: 5.0,
        ),
        Padding(padding: EdgeInsets.all(20.0)),
        Text(
          "Syncing Data....",
          style: TextStyle(fontSize: 25.0),
        ),
        Padding(padding: EdgeInsets.all(10.0)),
        Text(
          "Please don't exit this Page",
          style: TextStyle(fontSize: 25.0),
        ),
      ],
    ),
    "synced": Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.all(20.0)),
        Text(
          "All Data has been synced",
          style: TextStyle(fontSize: 25.0),
        ),
        Padding(padding: EdgeInsets.all(10.0)),
        Text(
          "You can go back now",
          style: TextStyle(fontSize: 25.0),
        ),
      ],
    ),
    "notSynced": Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.all(20.0)),
        Text(
          "Some error occurred, Data not synced !!",
          style: TextStyle(fontSize: 25.0),
        ),
        Padding(padding: EdgeInsets.all(10.0)),
        Text(
          "Please check your internet connection and try again",
          style: TextStyle(fontSize: 25.0),
        ),
      ],
    ),
  };

  // Databases
  final acharyaDatabase = AcharyaUserDetailsCRUD.instance;
  final studentsDatabase = StudentDetailsCRUD.instance;
  final allocatedContentDatabase = AllocatedContentCRUD.instance;
  final attendanceDatabase = AttendanceDetailsCRUD.instance;
  final questionBankDatabase = QuestionBankCRUD.instance;
  final allocatedQuizzesDatabase = QuizAllocationScheduleCRUD.instance;
  final quizDetailsDatabase = QuizQuestionsCRUD.instance;
  final videoProgressDatabase = VideoWatchedCRUD.instance;
  final quizOutcomeDatabase = QuizOutcomeCRUD.instance;
  final holidayDatabase=HolidayDetailsCRUD.instance;

  late List listOfDatabases;

  @override
  void initState() {
    super.initState();
    // Initialize list of databases
    listOfDatabases = [
      acharyaDatabase,
      studentsDatabase,
      allocatedContentDatabase,
      attendanceDatabase,
      questionBankDatabase,
      allocatedQuizzesDatabase,
      quizDetailsDatabase,
      videoProgressDatabase,
      quizOutcomeDatabase,
      holidayDatabase
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Sync Data",
          style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
        ),
      ),
      body: FutureBuilder(
        future: _statusChanger(),
        builder: (context, snapshot) {
          return Center(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 1.2,
              child: mapOfWidgets[syncStatus],
            ),
          );
        },
      ),
    );
  }

  // Method for changing sync Status according to state of sync
  Future<void> _statusChanger() async {
    if (syncStatus != "synced") {
      if (await _syncData()) {
        setState(() {
          syncStatus = "synced";
        });
      } else {
        setState(() {
          syncStatus = "notSynced";
        });
      }
    }
  }

  // Method for syncing of data
  Future<bool> _syncData() async {
    for (var x in listOfDatabases) {
      if (!(await _syncTableData(x))) return false;
    }
    return true;
  }

  // Method for syncing one table's data at a time
  Future<bool> _syncTableData(_database) async {
    var url = Uri.parse('http://ptsv2.com/t/ekaltestpostrequest');
    List<Map<String, dynamic>> _list = await _database.getAllRowsList();
    for (Map<String, dynamic> x in _list) {
      if (x.containsKey('totalWatchedTime') && x['dateOfSync'] != DateTime.now().toString().substring(0, 10)) { // Separate case for syncing of video Watched Details
        Map<String, dynamic> temp = Map.from(x);
        await temp.update("dateOfSync", (value) => DateTime.now().toString().substring(0, 10));
        await _database.updateRowById(temp);
        var retryClient = RetryClient(http.Client());
        var response;
        try {
          response = await http.post(url, body: json.encode(x), encoding: Encoding.getByName("utf-8"));
        } finally {
          retryClient.close();
        }
        if (response.statusCode != 200) return false;
      } else if (x["synced"] == "false") {
        Map<String, dynamic> temp = Map.from(x);
        await temp.update("synced", (value) => "true");
        await temp.update("dateOfSync", (value) => DateTime.now().toString().substring(0, 10));
        await _database.updateRowById(temp);
        var retryClient = RetryClient(http.Client());
        var response;
        try {
          response = await http.post(url, body: json.encode(x), encoding: Encoding.getByName("utf-8"));
        } finally {
          retryClient.close();
        }
        if (response.statusCode != 200) return false;
      }
    }
    await Future.delayed(Duration(milliseconds: 300)); // Wait 300 ms before moving on to next table
    return true;
  }

}
