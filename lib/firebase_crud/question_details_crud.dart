import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iitpal_acharya_ui/models/question_model.dart';
import '../screens/unique_key_device.dart';

class QuestionDetailsCRUD {
  /// Method to get all Questions created in the device
  Future<List<Map<String,dynamic>>> getAllQuestions() async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      Query _questions =
      FirebaseFirestore.instance.collection('Questions').where("deviceUniqueId", isEqualTo: deviceId);
      List<DocumentSnapshot> _questionDocs = (await _questions.get()).docs;
      List<Map<String,dynamic>> _questionsList =
      _questionDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _questionsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get the total number of questions in the device
  Future<int> getLength() async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      Query _questions =
      FirebaseFirestore.instance.collection('Questions').where("deviceUniqueId", isEqualTo: deviceId);
      List<DocumentSnapshot> _questionDocs = (await _questions.get()).docs;
      List<QuestionDetails> _questionsList =
      _questionDocs.map((e) => QuestionDetails.fromMap(e.data() as Map)).toList();
      return _questionsList.length;
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }

  /// Method to add a new Question in the device
  Future<void> addQuestion(QuestionDetails questionDetails) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('Questions').doc(questionDetails.id);
      await ref.set({
        'id': questionDetails.id,
        'gat': questionDetails.questionGat,
        'sub': questionDetails.questionSubject,
        'topic': questionDetails.questionTopic,
        'question': questionDetails.question,
        'a': questionDetails.a,
        'b': questionDetails.b,
        'c': questionDetails.c,
        'd': questionDetails.d,
        'ans': questionDetails.answer,
        'deviceUniqueId': questionDetails.deviceUniqueId,
        'synced': questionDetails.synced,
        'dateOfSync': questionDetails.dateOfSync,
      });
      print("Question Added");
    }catch(e){
      print(e.toString());
    }
  }

  /// Method to get the Question corresponding to the given ID in the device
  Future<List<Map<String,dynamic>>> getQuestionById(String id) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      CollectionReference _questions =
      FirebaseFirestore.instance.collection('Questions');
      final Query query = _questions.where("deviceUniqueId", isEqualTo: deviceId).where("id", isEqualTo: id);
      List<DocumentSnapshot> _questionDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _questionsList =
      _questionDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _questionsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get Questions created for the given Gat in the device
  Future<List<Map<String,dynamic>>> getQuestionByGat(String gat) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      CollectionReference _questions =
      FirebaseFirestore.instance.collection('Questions');
      final Query query = _questions.where("deviceUniqueId", isEqualTo: deviceId).where("gat", isEqualTo: gat);
      List<DocumentSnapshot> _questionDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _questionsList =
      _questionDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      print(_questionsList);
      return _questionsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get Questions created for the given Gat and Topic in the device
  Future<List<Map<String,dynamic>>> getQuestionByGatTopic(String gat, String topic) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceId = (await getId())!;
    try {
      CollectionReference _questions =
      FirebaseFirestore.instance.collection('Questions');
      final Query query = _questions.where("deviceUniqueId", isEqualTo: deviceId).where("gat", isEqualTo: gat).where("topic", isEqualTo: topic);
      List<DocumentSnapshot> _questionDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _questionsList =
      _questionDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      print(_questionsList);
      return _questionsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

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