import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../models/attendance_details_model.dart';
import '../screens/unique_key_device.dart';

class AttendanceDetailsDataService {
  /// Method to get all Attendance Data in the device
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    String deviceid = (await getId())!;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      Query _students = FirebaseFirestore.instance.collection('AttendanceData').where("deviceUniqueId", isEqualTo: deviceid);
      List<DocumentSnapshot> _acharyaDocs = (await _students.get()).docs;
      List<Map<String,dynamic>> _attendanceList =
      _acharyaDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _attendanceList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to add new Attendance Data in the device
  Future<void> insertNewRecord({required AttendanceDetails attendanceDetails}) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('AttendanceData').doc(attendanceDetails.id);
      await ref.set({
        'id': attendanceDetails.id,
        'date': attendanceDetails.date,
        'Attendance': attendanceDetails.Attendance,
        'deviceUniqueId': attendanceDetails.deviceUniqueId,
        'synced': attendanceDetails.synced,
        'dateOfSync': attendanceDetails.dateOfSync,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  /// Method to get Attendance Data by given Date in the device
  Future<List<Map<String, dynamic>>> getAttendanceDetailsByDate(String date) async {
    String deviceid = (await getId())!;
    try {
      Query math_questions = await FirebaseFirestore.instance
          .collection('AttendanceData')
          .where("deviceUniqueId", isEqualTo: deviceid)
          .where("date", isEqualTo: date);
      List<DocumentSnapshot> math_docs = (await math_questions.get()).docs;
      List<Map<String,dynamic>> _videoWatchedDetailslist =
      math_docs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _videoWatchedDetailslist;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get Attendance Data by given Month in the device
  Future<List<Map<String, dynamic>>> getAttendanceDetailsByMonth(String month) async {
    String deviceid = (await getId())!;
    try {
      Query math_questions = await FirebaseFirestore.instance.collection('AttendanceData').where("deviceUniqueId", isEqualTo: deviceid);
      List<DocumentSnapshot> math_docs = (await math_questions.get()).docs;
      List<Map<String,dynamic>> _videoWatchedDetailslist =
      math_docs.map((e) => Map<String,dynamic>.from((e.data() as Map))).where((element) {
        if(element["date"].contains("-$month-"))
          return true;
        return false;
      }).toList();
      return _videoWatchedDetailslist;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  // Future<void> updateRowById(Map<String, dynamic> attendanceDetails) async {
  //   FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  //   FirebaseFirestore.instance.settings.persistenceEnabled;
  //   try {
  //     DocumentReference ref = _fireStore.collection('AttendanceData').doc(attendanceDetails["id"]);
  //     await ref.update({
  //       'date': attendanceDetails["date"],
  //       'Attendance': attendanceDetails["Attendance"],
  //       'deviceUniqueId': attendanceDetails["deviceUniqueId"],
  //       'synced': attendanceDetails["synced"],
  //       'dateOfSync': attendanceDetails["dateOfSync"],
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

// Future<void> deleteStudent({required String id}) async {
//   FirebaseFirestore _fireStore = FirebaseFirestore.instance;
//   FirebaseFirestore.instance.settings.persistenceEnabled;
//   try {
//     DocumentReference ref = _fireStore.collection('Students').doc(id);
//     await ref.delete();
//     print("Student Deleted");
//   }catch(e){
//     print(e.toString());
//   }
// }

}