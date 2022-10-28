import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iitpal_acharya_ui/models/student_details_model.dart';
import 'package:iitpal_acharya_ui/screens/unique_key_device.dart';

class StudentDataService {
  /// Method to get all Student Details in the device
  Future<List<Map<String,dynamic>>> getAllStudents() async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceid = (await getId())!;
    try {
      Query _students = FirebaseFirestore.instance.collection('Students').where("deviceUniqueId", isEqualTo: deviceid);
      List<DocumentSnapshot> _studentDocs = (await _students.get()).docs;
      List<Map<String,dynamic>> _studentList =
      _studentDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _studentList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get Student Details by given Gat in the device
  Future<List<Map<String,dynamic>>> getStudentByGat(String gat) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceid = (await getId())!;
    try {
      CollectionReference _studentDetails =
      FirebaseFirestore.instance.collection('Students');
      final Query query = _studentDetails.where("deviceUniqueId", isEqualTo: deviceid).where("gat", isEqualTo: gat);
      List<DocumentSnapshot> _studentDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _studentList =
      _studentDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _studentList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get Student Details by given filter in the device
  Future<List<Map<String,dynamic>>> getStudentsByFilter(String filter) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceid = (await getId())!;
    try {
      Query query =
          FirebaseFirestore.instance.collection('Students').where("deviceUniqueId", isEqualTo: deviceid);
      List<DocumentSnapshot> _studentDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _studentList =
      _studentDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).where((element) {
        if(element["name"].contains(filter))
          return true;
        return false;
      }).toList();
      return _studentList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to add new Student Details in the device
  Future<void> addStudent({required StudentDetails studentDetails}) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('Students').doc(studentDetails.id);
      await ref.set({
        'id': studentDetails.id,
        'name': studentDetails.studentName,
        'gat': studentDetails.studentGat,
        'age': studentDetails.studentAge,
        'deviceUniqueId': studentDetails.deviceUniqueId,
        'synced': studentDetails.synced,
        'dateOfSync': studentDetails.dateOfSync,
      });
      print("Student Added");
    } catch (e) {
      print(e.toString());
    }
  }

  /// Method to update Student Details in the device
  Future<void> updateStudent({required StudentDetails studentDetails}) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('Students').doc(studentDetails.id);
      await ref.update({
        'id': studentDetails.id,
        'name': studentDetails.studentName,
        'gat': studentDetails.studentGat,
        'age': studentDetails.studentAge,
        'deviceUniqueId': studentDetails.deviceUniqueId,
        'synced': studentDetails.synced,
        'dateOfSync': studentDetails.dateOfSync,
      });
      print("Student Updated");
    } catch (e) {
      print(e.toString());
    }
  }

  /// Method to delete Student Details in the device
  Future<void> deleteStudent({required String id}) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('Students').doc(id);
      await ref.delete();
      print("Student Deleted");
    } catch (e) {
      print(e.toString());
    }
  }
}
