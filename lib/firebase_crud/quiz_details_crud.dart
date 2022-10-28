import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/quiz_details_model.dart';
import '../screens/unique_key_device.dart';

class QuizQuestionsCRUD {
  /// Method to add Questions to a Quiz in the device
  Future<void> createQuiz(QuizQuestions quizQuestions) async{
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('QuizQuestions').doc(quizQuestions.quizId);
      await ref.set({
        'quizId': quizQuestions.quizId,
        'questionId': quizQuestions.questionId,
        'deviceUniqueId': quizQuestions.deviceUniqueId,
        'synced': quizQuestions.synced,
        'dateOfSync': quizQuestions.dateOfSync,
      });
      print("Questions Allocated");
    }catch(e){
      print(e.toString());
    }
  }

  /// Method to get Question IDs of a given Quiz ID in the device
  Future<List<String>> getQuestionIDByQuizID(String quizID) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      CollectionReference _quizQuestions =
      FirebaseFirestore.instance.collection('QuizQuestions');
      final Query query = _quizQuestions.where("deviceUniqueId", isEqualTo: deviceId).where("quizId", isEqualTo: quizID);
      List<DocumentSnapshot> _quizQuestionsDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _quizQuestionsList =
      _quizQuestionsDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      // List<String> _questionIDs = _quizQuestionsList[0]["questionId"].map((s) => s as String).toList();
      List<String> _questionIDs = _quizQuestionsList[0]["questionId"].cast<String>();
      return _questionIDs;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to delete the Quiz Questions by given ID in the device
  Future<void> deleteQuestionByQuizId(String id) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('QuizQuestions').doc(id);
      await ref.delete();
      print("Quiz Questions Deleted");
    }catch(e){
      print(e.toString());
    }
  }
}