import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/quiz_outcome_model.dart';
import '../screens/unique_key_device.dart';

class QuizOutcomeCRUD {
  /// Method to add new Quiz Outcome in the device
  Future<void> insertNewQuizOutcome(QuizOutcome quizOutcome) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('QuizOutcome').doc(quizOutcome.docID);
      await ref.set({
        'studentID': quizOutcome.studentID,
        'quizID': quizOutcome.quizID,
        'docID': quizOutcome.docID,
        'score': quizOutcome.score,
        'maxMarks': quizOutcome.maxMarks,
        'timeTaken': quizOutcome.timeTaken,
        'deviceUniqueId': quizOutcome.deviceUniqueId,
        'synced': quizOutcome.synced,
        'dateOfSync': quizOutcome.dateOfSync,
      });
      print("Quiz Outcome Submitted");
    }catch(e){
      print(e.toString());
    }
  }

  /// Method to get the Quiz Outcome by given Student ID in the device
  Future<List<Map<String, dynamic>>> getQuizOutcomeByStudentId(String studentId) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      CollectionReference _quizOutcome =
      FirebaseFirestore.instance.collection('QuizOutcome');
      final Query query = _quizOutcome.where("deviceUniqueId", isEqualTo: deviceId).where("studentID", isEqualTo: studentId);
      List<DocumentSnapshot> _quizOutcomeDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _quizOutcomeList =
      _quizOutcomeDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _quizOutcomeList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get Quiz Outcome by given Student ID and Quiz ID in the device
  Future<List<Map<String, dynamic>>> getQuizOutcomeByStudentAndQuizID(String studentId, String quizId) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      CollectionReference _quizOutcome =
      FirebaseFirestore.instance.collection('QuizOutcome');
      final Query query = _quizOutcome.where("deviceUniqueId", isEqualTo: deviceId).where("studentID", isEqualTo: studentId).where("quizID", isEqualTo: quizId);
      List<DocumentSnapshot> _quizOutcomeDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _quizOutcomeList =
      _quizOutcomeDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _quizOutcomeList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to check whether a Student has given a Quiz or not in the device
  Future<int> checkQuizGivenByStudent(String studentId, String quizId) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      CollectionReference _quizOutcome =
      FirebaseFirestore.instance.collection('QuizOutcome');
      final Query query = _quizOutcome.where("deviceUniqueId", isEqualTo: deviceId).where("studentID", isEqualTo: studentId).where("quizID", isEqualTo: quizId);
      List<DocumentSnapshot> _quizOutcomeDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _quizOutcomeList =
      _quizOutcomeDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _quizOutcomeList.length;
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }
}