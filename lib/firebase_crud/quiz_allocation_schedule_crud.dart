import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iitpal_acharya_ui/models/quiz_allocation_schedule_model.dart';
import '../screens/unique_key_device.dart';

class QuizAllocationScheduleFirabase {
  /// Method to allocate a new quiz in the device
  Future<void> allocateNewQuiz(QuizAllocationSchedule quizAllocationSchedule) async{
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('QuizAllocationSchedule').doc(quizAllocationSchedule.quizId);
      await ref.set({
        'id': quizAllocationSchedule.quizId,
        'gat': quizAllocationSchedule.quizGat,
        'date': quizAllocationSchedule.quizDate,
        'time': quizAllocationSchedule.quizTime,
        'deviceUniqueId': quizAllocationSchedule.deviceUniqueId,
        'synced': quizAllocationSchedule.synced,
        'dateOfSync': quizAllocationSchedule.dateOfSync,
      });
      print("Quiz Allocated");
    }catch(e){
    print(e.toString());
    }
  }
  /// Method to get all Allocated Quizzes in the device
  Future<List<Map<String,dynamic>>> getSpecialQuizList(String deviceId) async {
    try {
      Query _quizAllocationSchedule =
      FirebaseFirestore.instance.collection('QuizAllocationSchedule').where("deviceUniqueId", isEqualTo: deviceId);
      List<DocumentSnapshot> _quizAllocationDocs = (await _quizAllocationSchedule.get()).docs;
      List<Map<String,dynamic>> _allocatedQuizList =
      _quizAllocationDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _allocatedQuizList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get all Allocated Quizzes in the device
  Future<List<Map<String,dynamic>>> getAllRowsList() async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      Query _quizAllocationSchedule =
      FirebaseFirestore.instance.collection('QuizAllocationSchedule').where("deviceUniqueId", isEqualTo: deviceId);
      List<DocumentSnapshot> _quizAllocationDocs = (await _quizAllocationSchedule.get()).docs;
      List<Map<String,dynamic>> _allocatedQuizList =
      _quizAllocationDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _allocatedQuizList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get Allocated Quizzes by given Month in the device
  Future<List<Map<String, dynamic>>> getAllocatedQuizByMonth(String month) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      Query _quizAllocationSchedule =
      FirebaseFirestore.instance.collection('QuizAllocationSchedule').where("deviceUniqueId", isEqualTo: deviceId);
      // final Query query = _quizAllocationSchedule.where("date"[5] + "date"[6], isEqualTo: month);
      List<DocumentSnapshot> _quizAllocationDocs = (await _quizAllocationSchedule.get()).docs;
      List<Map<String,dynamic>> temp =
      _quizAllocationDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      List<Map<String,dynamic>> _allocatedQuizList=[];
      for(int i=0; i<temp.length; i++){
        if(temp[i]["date"].toString().substring(5,7) == month){
          _allocatedQuizList.add(temp[i]);
        }
      }
      return _allocatedQuizList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get Allocated Quiz by given ID in the device
  Future<List<Map<String, dynamic>>> getAllocatedQuizById(String id) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      CollectionReference _quizAllocationSchedule =
      FirebaseFirestore.instance.collection('QuizAllocationSchedule');
      final Query query = _quizAllocationSchedule.where("deviceUniqueId", isEqualTo: deviceId).where("id", isEqualTo: id);
      List<DocumentSnapshot> _quizAllocationDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _allocatedQuizList =
      _quizAllocationDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _allocatedQuizList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get Allocated Quiz by given Date in the device
  Future<List<Map<String, dynamic>>> getAllocatedQuizByDate(String date,String deviceId) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      CollectionReference _quizAllocationSchedule =
      FirebaseFirestore.instance.collection('QuizAllocationSchedule');
      final Query query = _quizAllocationSchedule.where("deviceUniqueId", isEqualTo: deviceId).where("date", isEqualTo: date);
      List<DocumentSnapshot> _quizAllocationDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _allocatedQuizList =
      _quizAllocationDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _allocatedQuizList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to delete Allocated Quiz by given ID in the device
  Future<void> deleteAllocatedQuizById(String id) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('QuizAllocationSchedule').doc(id);
      await ref.delete();
      print("Allocated Quiz Deleted");
    }catch(e){
      print(e.toString());
    }
  }
}