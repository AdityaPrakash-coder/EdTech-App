import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/database_crud/attendance_details_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/attendance_taken_by_date_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/content_details_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/question_bank_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/video_watched_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/attendance_details_by_date.dart';
import 'package:iitpal_acharya_ui/firebase_crud/attendance_details_crud_firebase.dart';
import 'package:iitpal_acharya_ui/firebase_crud/content_details_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/student_data_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/video_watched_crud.dart';
import 'package:iitpal_acharya_ui/models/content_details_model.dart';
import 'package:path_provider/path_provider.dart';
import '../database_crud/student_details_crud.dart';
import '../firebase_crud/question_details_crud.dart';
import '../models/attendance_details_model.dart';
import '../models/date_wise_attendance_record_model.dart';
import '../models/question_model.dart';
import '../models/student_details_model.dart';
import '../models/video_watched_model.dart';
import '../screens/unique_key_device.dart';

class SampleData {
 /* final studentDatabase = StudentDataService();
  final attendanceDetailsDatabase = AttendanceDetailsDataService();
  final questionDetailsCRUD = QuestionDetailsCRUD();
  final dateWiseAttendanceDatabase = DateWiseRecordDataService();
  final videoDetailsDatabase = ContentDetailsService();
  final videoWatchedDetailsDatabase = VideoWatchedDataService();
  String deviceUniqueId = "";*/
  final studentDatabase = StudentDetailsCRUD.instance;
  final attendanceDetailsDatabase = AttendanceDetailsCRUD.instance;
  final quizQuestionsDatabase = QuestionBankCRUD.instance;
  final dateWiseAttendanceDatabase = DateWiseAttendanceRecordsCRUD.instance;
  final contentsDatabase = ContentDetailsCRUD.instance;
  final videoWatchedDetailsDatabase = VideoWatchedCRUD.instance;
  String deviceUniqueId = "";
  List<String> listids = [];

  SampleData() {
    getid();
  }

  /// Device Unique Id
  void getid() async {
    deviceUniqueId = (await getId())!;
    getListOfIds(deviceUniqueId);
    await addSampleVideoDetails();
  }
  void getListOfIds(String deviceUniqueId) async {
    for(int i=0;i<12;i++) {
      listids.add(UniqueKey().toString().substring(2, 7) + deviceUniqueId);
    }
  }

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  /// Sample data adders
  Future<void> addSampleStudents() async {
    StudentDetails student1 = StudentDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[0],
        studentName: "Avinash",
        studentGat: "बाल गट-1",
        studentAge: 6,
        deviceUniqueId: deviceUniqueId);
    StudentDetails student2 = StudentDetails(
        synced: 'false', dateOfSync: '', id: listids[1], studentName: "Nikhil", studentGat: "बाल गट-2", studentAge: 9, deviceUniqueId: deviceUniqueId);
    StudentDetails student3 = StudentDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[2],
        studentName: "Kartavya",
        studentGat: "बाल गट-1",
        studentAge: 6,
        deviceUniqueId: deviceUniqueId);
    StudentDetails student4 = StudentDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[3],
        studentName: "Harsh",
        studentGat: "बाल गट-2",
        studentAge: 10,
        deviceUniqueId: deviceUniqueId);
    StudentDetails student5 = StudentDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[4],
        studentName: "Anuj",
        studentGat: "शिशु गट",
        studentAge: 6,
        deviceUniqueId: deviceUniqueId);
    StudentDetails student6 = StudentDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[5],
        studentName: "Shivani",
        studentGat: "शिशु गट",
        studentAge: 9,
        deviceUniqueId: deviceUniqueId);
    StudentDetails student7 = StudentDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[6],
        studentName: "Janvi",
        studentGat: "बाल गट-1",
        studentAge: 6,
        deviceUniqueId: deviceUniqueId);
    StudentDetails student8 = StudentDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[7],
        studentName: "Rajesh",
        studentGat: "बाल गट-2",
        studentAge: 10,
        deviceUniqueId: deviceUniqueId);
    StudentDetails student9 = StudentDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[8],
        studentName: "Sanya",
        studentGat: "शिशु गट",
        studentAge: 6,
        deviceUniqueId: deviceUniqueId);
    StudentDetails student10 = StudentDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[9],
        studentName: "Judy",
        studentGat: "शिशु गट",
        studentAge: 9,
        deviceUniqueId: deviceUniqueId);
    StudentDetails student11 = StudentDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[10],
        studentName: "Suneet",
        studentGat: "बाल गट-1",
        studentAge: 6,
        deviceUniqueId: deviceUniqueId);
    StudentDetails student12 = StudentDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[11],
        studentName: "Harshit",
        studentGat: "बाल गट-2",
        studentAge: 10,
        deviceUniqueId: deviceUniqueId);
    await studentDatabase.insertNewStudent(student1);
    await studentDatabase.insertNewStudent(student2);
    await studentDatabase.insertNewStudent(student3);
    await studentDatabase.insertNewStudent(student4);
    await studentDatabase.insertNewStudent(student5);
    await studentDatabase.insertNewStudent(student6);
    await studentDatabase.insertNewStudent(student7);
    await studentDatabase.insertNewStudent(student8);
    await studentDatabase.insertNewStudent(student9);
    await studentDatabase.insertNewStudent(student10);
    await studentDatabase.insertNewStudent(student11);
    await studentDatabase.insertNewStudent(student12);
  }

  Future<void> addSampleAttendanceData() async {
    List<AttendanceDetails> _list =[];
    _list.add(AttendanceDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[1],
        date: DateTime.now().toString().substring(0, 10),
        Attendance: 'absent',
        deviceUniqueId: deviceUniqueId));
    _list.add(AttendanceDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[3],
        date: DateTime.now().toString().substring(0, 10),
        Attendance: 'present',
        deviceUniqueId: deviceUniqueId));
    _list.add(AttendanceDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[4],
        date: DateTime.now().toString().substring(0, 10),
        Attendance: 'absent',
        deviceUniqueId: deviceUniqueId));
    _list.add(AttendanceDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[5],
        date: DateTime.now().toString().substring(0, 10),
        Attendance: 'present',
        deviceUniqueId: deviceUniqueId));;
    _list.add(AttendanceDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[7],
        date: DateTime.now().toString().substring(0, 10),
        Attendance: 'absent',
        deviceUniqueId: deviceUniqueId));
    _list.add(AttendanceDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[8],
        date: DateTime.now().toString().substring(0, 10),
        Attendance: 'present',
        deviceUniqueId: deviceUniqueId));
    _list.add(AttendanceDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[9],
        date: DateTime.now().toString().substring(0, 10),
        Attendance: 'present',
        deviceUniqueId: deviceUniqueId));
    _list.add(AttendanceDetails(
        synced: 'false',
        dateOfSync: '',
        id: listids[11],
        date: DateTime.now().toString().substring(0, 10),
        Attendance: 'present',
        deviceUniqueId: deviceUniqueId));
    for (int i = 0; i < _list.length; i++) {
      await attendanceDetailsDatabase.insertNewRecord(_list[i]);
    }
    DateWiseRecord dateWiseRecord1 = DateWiseRecord(date: DateTime.now().toString().substring(0, 10), gat: "बाल गट-2", deviceUniqueId: deviceUniqueId);
    DateWiseRecord dateWiseRecord2 = DateWiseRecord(date: DateTime.now().toString().substring(0, 10), gat: "शिशु गट", deviceUniqueId: deviceUniqueId);
    await dateWiseAttendanceDatabase.insertNewDateRecord(dateWiseRecord1);
    await dateWiseAttendanceDatabase.insertNewDateRecord(dateWiseRecord2);
  }

  Future<void> addSampleQuestions() async {
    deviceUniqueId = (await getId())!;
    List<QuestionDetails> _list = [];
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'शिशु गट',
        questionSubject: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        questionTopic: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        question: 'How many ' 'a' 's are in "alpha"?',
        a: '1',
        b: '2',
        c: '3',
        d: '4',
        answer: '2',
        deviceUniqueId: deviceUniqueId));
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'शिशु गट',
        questionSubject: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        questionTopic: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        question: 'How many ' 'b' 's are in "beta"?',
        a: '1',
        b: '2',
        c: '3',
        d: '4',
        answer: '1',
        deviceUniqueId: deviceUniqueId));
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'शिशु गट',
        questionSubject: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        questionTopic: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        question: '1+2?',
        a: '1',
        b: '2',
        c: '3',
        d: '4',
        answer: '3',
        deviceUniqueId: deviceUniqueId));
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'शिशु गट',
        questionSubject: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        questionTopic: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        question: '6-2?',
        a: '1',
        b: '2',
        c: '3',
        d: '4',
        answer: '4',
        deviceUniqueId: deviceUniqueId));
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'बाल गट-1',
        questionSubject: 'सामान्य ज्ञान विज्ञान',
        questionTopic: 'सामान्य ज्ञान विज्ञान',
        question: 'Who is the Prime Minister of India?',
        a: 'Manmohan Singh',
        b: 'Amit Shah',
        c: 'Rahul Gandhi',
        d: 'Narendra Modi',
        answer: 'Narendra Modi',
        deviceUniqueId: deviceUniqueId));
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'बाल गट-1',
        questionSubject: 'सामान्य ज्ञान विज्ञान',
        questionTopic: 'सामान्य ज्ञान विज्ञान',
        question: 'Which animal is a carnivore?',
        a: 'Lion',
        b: 'Cow',
        c: 'Goat',
        d: 'Rabbit',
        answer: 'Lion',
        deviceUniqueId: deviceUniqueId));
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'बाल गट-1',
        questionSubject: 'संस्कार शिक्षा',
        questionTopic: 'संस्कार शिक्षा',
        question: 'Should you hit a person?',
        a: 'Never',
        b: 'Definitely',
        c: 'It Depends',
        d: 'None of the above',
        answer: 'It Depends',
        deviceUniqueId: deviceUniqueId));
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'बाल गट-1',
        questionSubject: 'संस्कार शिक्षा',
        questionTopic: 'संस्कार शिक्षा',
        question: 'Should you lie to your doctor?',
        a: 'Never',
        b: 'Definitely',
        c: 'It Depends',
        d: 'None of the above',
        answer: 'Never',
        deviceUniqueId: deviceUniqueId));
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'बाल गट-2',
        questionSubject: 'स्वास्थ्य शिक्षा',
        questionTopic: 'स्वास्थ्य शिक्षा',
        question: 'How to treat a wound?',
        a: 'Wrap a bandage',
        b: 'Clean the wound',
        c: 'Apply antiseptic',
        d: 'All of the above',
        answer: 'All of the above',
        deviceUniqueId: deviceUniqueId));
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'बाल गट-2',
        questionSubject: 'शारीरिक शिक्षा',
        questionTopic: 'शारीरिक शिक्षा',
        question: 'How many kidneys are there in a person?',
        a: '1',
        b: '2',
        c: '3',
        d: '4',
        answer: '2',
        deviceUniqueId: deviceUniqueId));
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'बाल गट-2',
        questionSubject: 'हस्तशिल्प (सृजन)',
        questionTopic: 'हस्तशिल्प (सृजन)',
        question: 'Which among the following is a type of origami?',
        a: 'Golden Venture',
        b: 'Wet folding',
        c: 'Pure land',
        d: 'All of the above',
        answer: 'All of the above',
        deviceUniqueId: deviceUniqueId));
    _list.add(QuestionDetails(
        synced: 'false',
        dateOfSync: '',
        id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
        questionGat: 'बाल गट-2',
        questionSubject: 'हस्तशिल्प (सृजन)',
        questionTopic: 'हस्तशिल्प (सृजन)',
        question: 'How many embroidery stiches are there?',
        a: '0-50',
        b: '50-150',
        c: '150-250',
        d: '250+',
        answer: '250+',
        deviceUniqueId: deviceUniqueId));
    for (int i = 0; i < _list.length; i++) {
      print(_list[i].deviceUniqueId);
      await quizQuestionsDatabase.insertNewQuestion(_list[i]);
    }
  }

  Future<void> addSampleVideoDetails() async{
    deviceUniqueId = (await getId())!;
    List<Directory> extDirectories = (await getExternalStorageDirectories())!;
    List<String> dirs = extDirectories[0].toString().split('/');
    String rebuiltPath = '/' + dirs[1] + '/' + dirs[2] + '/' + dirs[3] + '/';
    List listOfShishu = Directory(rebuiltPath+"3. शिशु गट - (4-6 (वर्ष)").listSync();
    List listOfBalGat1 = Directory(rebuiltPath+"4. बाल गट - 1 (6-8 वर्ष)").listSync();
    List listOfBalGat2 = Directory(rebuiltPath+"5. बाल गट - 2 (8-10  वर्ष)").listSync();
    List subjectsOfShishuGat = [];
    List subjectsOfBalGat1 = [];
    List subjectsOfBalGat2 = [];
    for(var x in listOfShishu){
      var temp = Directory(x.toString().substring(12,x.toString().length-1)+"/").listSync();
      for(var i in temp){
        subjectsOfShishuGat.add(i.toString());
      }
    }
    for(var x in listOfBalGat1){
      var temp = Directory(x.toString().substring(12,x.toString().length-1)+"/").listSync();
      for(var i in temp){
        subjectsOfBalGat1.add(i.toString());
      }
    }
    for(var x in listOfBalGat2){
      var temp = Directory(x.toString().substring(12,x.toString().length-1)+"/").listSync();
      for(var i in temp){
        subjectsOfBalGat2.add(i.toString());
      }
    }

    List<ContentDetails> _list = [];

    for(var x in subjectsOfShishuGat){
      List<String> splitList = x.split("/");
      var videot = splitList[6];
      while(isNumeric(videot[0]))
          videot = videot.substring(1,videot.length);
      videot = videot.substring(1,videot.length-4);
      _list.add(ContentDetails(
          id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
          videoName: videot,
          gat: "शिशु गट",
          subject: splitList[5].substring(3,splitList[5].length),
          topic: splitList[5].substring(3,splitList[5].length),
          version: "1.0",
          dateOfLastModification: DateTime.now().toString().substring(0,10),
          videoPath: splitList[4]+"/"+splitList[5]+"/"+splitList[6].substring(0,splitList[6].length-1)));
    }
    for(var x in subjectsOfBalGat1){
      List<String> splitList = x.split("/");
      var videot = splitList[6];
      while(isNumeric(videot[0]))
        videot = videot.substring(1,videot.length);
      videot = videot.substring(1,videot.length-4);
      _list.add(ContentDetails(
          id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
          videoName: videot,
          gat: "बाल गट-1",
          subject: splitList[5].substring(3,splitList[5].length),
          topic: splitList[5].substring(3,splitList[5].length),
          version: "1.0",
          dateOfLastModification: DateTime.now().toString().substring(0,10),
          videoPath: splitList[4]+"/"+splitList[5]+"/"+splitList[6].substring(0,splitList[6].length-1)));
    }
    for(var x in subjectsOfBalGat2){
      List<String> splitList = x.split("/");
      var videot = splitList[6];
      while(isNumeric(videot[0]))
        videot = videot.substring(1,videot.length);
      videot = videot.substring(1,videot.length-4);
      _list.add(ContentDetails(
          id: UniqueKey().toString().substring(2, 7) + deviceUniqueId,
          videoName: videot,
          gat: "बाल गट-2",
          subject: splitList[5].substring(3,splitList[5].length),
          topic: splitList[5].substring(3,splitList[5].length),
          version: "1.0",
          dateOfLastModification: DateTime.now().toString().substring(0,10),
          videoPath: splitList[4]+"/"+splitList[5]+"/"+splitList[6].substring(0,splitList[6].length-1)));
    }


    for (int i = 0; i < _list.length; i++) {
      await contentsDatabase.insertNewContent(_list[i]);
    }
  }

  Future<void> addSampleVideoWatchedDetails() async {
    List<VideoWatchedDetails> _list = [];
    _list.add(VideoWatchedDetails(
        synced: 'false',
        dateOfSync: '',
        Gat: 'बाल गट-1',
        Subject: 'G.K.',
        Topic: 'Current Affairs',
        totalWatchedTime: '0',
        total_video_length: '30',
        id: "1",
        deviceUniqueId: deviceUniqueId));
    _list.add(VideoWatchedDetails(
        synced: 'false',
        dateOfSync: '',
        Gat: 'बाल गट-1',
        Subject: 'G.K.',
        Topic: 'General Science',
        totalWatchedTime: '30',
        total_video_length: '30',
        id: "2",
        deviceUniqueId: deviceUniqueId));
    _list.add(VideoWatchedDetails(
        synced: 'false',
        dateOfSync: '',
        Gat: 'बाल गट-2',
        Subject: 'Healthcare',
        Topic: 'First Aid',
        totalWatchedTime: '0',
        total_video_length: '30',
        id: "3",
        deviceUniqueId: deviceUniqueId));
    _list.add(VideoWatchedDetails(
        synced: 'false',
        dateOfSync: '',
        Gat: 'बाल गट-2',
        Subject: 'Handcraft',
        Topic: 'Origami',
        totalWatchedTime: '9',
        total_video_length: '30',
        id: "4",
        deviceUniqueId: deviceUniqueId));
    _list.add(VideoWatchedDetails(
        synced: 'false',
        dateOfSync: '',
        Gat: 'शिशु गट',
        Subject: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        Topic: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        totalWatchedTime: '15',
        total_video_length: '30',
        id: "5",
        deviceUniqueId: deviceUniqueId));
    _list.add(VideoWatchedDetails(
        synced: 'false',
        dateOfSync: '',
        Gat: 'शिशु गट',
        Subject: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        Topic: 'भाषा, गणित एवं सामान्य ज्ञान विज्ञान',
        totalWatchedTime: '0',
        total_video_length: '30',
        id: "6",
        deviceUniqueId: deviceUniqueId));
    for (int i = 0; i < _list.length; i++) {
      await videoWatchedDetailsDatabase.insertNewRaw(_list[i]);
    }
  }
}
