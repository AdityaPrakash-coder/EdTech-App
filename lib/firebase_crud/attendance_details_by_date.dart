import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import '../models/date_wise_attendance_record_model.dart';
import '../screens/unique_key_device.dart';

class DateWiseRecordDataService {
  /// Method to get all Date wise Records in the device
  Future<List<Map<String, dynamic>>> getList() async {
    String deviceid = (await getId())!;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      Query _students =
      FirebaseFirestore.instance.collection('DateWiseRecords').where("deviceUniqueId", isEqualTo: deviceid);
      List<DocumentSnapshot> _acharyaDocs = (await _students.get()).docs;
      List<Map<String,dynamic>> _attendanceList =
      _acharyaDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _attendanceList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to add new Date wise Record in the device
  Future<void> insertNewDateRecord({required DateWiseRecord dateWiseRecord}) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('DateWiseRecords').doc();
      await ref.set({
        'date': dateWiseRecord.date,
        'gat': dateWiseRecord.gat,
        'deviceUniqueId': dateWiseRecord.deviceUniqueId,
      });
    }catch(e){
      print(e.toString());
    }
  }

  /// Method to get Date wise Records by given Date and Gat in the device
  Future<List<Map<String, dynamic>>> getRecordByDateAndGat(String date,String gat) async {
    String deviceid = (await getId())!;
    try {
      Query math_questions = await FirebaseFirestore.instance
          .collection('DateWiseRecods')
          .where("date", isEqualTo: date).where("gat",isEqualTo: gat).where("deviceUniqueId", isEqualTo: deviceid);
      List<DocumentSnapshot> math_docs = (await math_questions.get()).docs;
      List<Map<String,dynamic>> _videoWatchedDetailslist =
      math_docs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _videoWatchedDetailslist;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}