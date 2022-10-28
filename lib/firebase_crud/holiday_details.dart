
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iitpal_acharya_ui/models/attendance_details_model.dart';
import 'package:iitpal_acharya_ui/models/holiday_model.dart';
import 'package:iitpal_acharya_ui/screens/unique_key_device.dart';

class HolidayDetailsDataService {
  /// Method to get all Holiday Data in the device
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    String deviceid = (await getId())!;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      Query _holidays = FirebaseFirestore.instance.collection('Holiday_data').where("deviceUniqueId", isEqualTo: deviceid);
      List<DocumentSnapshot> _holidaysDocs = (await _holidays.get()).docs;
      List<Map<String,dynamic>> _attendanceList =
      _holidaysDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _attendanceList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to add new Holiday Data in the device
  Future<void> insertNewRecord({required HolidayDetails holidayDetails}) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    print("updating holiday data to database");
    try {
      DocumentReference ref = _fireStore.collection('Holiday_data').doc(holidayDetails.id);
      await ref.set({
        'id': holidayDetails.id,
        'date': holidayDetails.dateOfHoliday,
        'deviceUniqueId': holidayDetails.deviceUniqueId,
        'remark':holidayDetails.remark,
        'gat':holidayDetails.gat,

      });
      print("updated");
    } catch (e) {
      print(e.toString());
    }
  }

  /// Method to get Holiday Data by given Date in the device
  Future<List<Map<String, dynamic>>> getHolidayDetailsByDate(String date) async {
    String deviceid = (await getId())!;
    print("check data by date");
    try {
      Query math_questions = await FirebaseFirestore.instance
          .collection('Holiday_data')
          .where("deviceUniqueId", isEqualTo: deviceid)
          .where("date", isEqualTo: date);
      List<DocumentSnapshot> math_docs = (await math_questions.get()).docs;
      List<Map<String,dynamic>> _videoWatchedDetailslist =
      math_docs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      print("checked");
      return _videoWatchedDetailslist;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

