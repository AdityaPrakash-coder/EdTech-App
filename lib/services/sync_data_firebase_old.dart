import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/database_crud/allocated_content_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/attendance_details_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/holiday_database.dart';
import 'package:iitpal_acharya_ui/database_crud/login_signup_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/question_bank_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_allocation_schedule_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_details_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_outcome_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/student_details_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/video_watched_crud.dart';

class _syncDatatoFirebase{
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
  _syncDatatoFirebase() {
    _issyncdata();
  }
  void _issyncdata()async {
    await addStudent();
  }
  Future<void> addStudent() async{
    List<Map<String, dynamic>> _list = await studentsDatabase.getAllRowsList();
    print(_list);
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    for (Map<String, dynamic> x in _list) {
      if(x["synced"]==false) {
        try {
          DocumentReference ref = _fireStore.collection('Students').doc(
              x["id"]);
          await ref.set({
            'id': x["id"],
            'name': x["name"],
            'gat': x["gat"],
            'age': x["age"],
            'deviceUniqueId': x["deviceUniqueId"],
            'synced': "true",
            'dateOfSync': DateTime.now().toString().substring(0, 10),
          });
          print("Student Added");
        } catch (e) {
          print(e.toString());
        }
      }
      else{
        print("you have already synced the data");
      }
    }
  }
}
