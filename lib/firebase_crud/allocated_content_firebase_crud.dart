import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iitpal_acharya_ui/models/allocated_content_model.dart';
import '../screens/unique_key_device.dart';

class AllocatedContentService {
  /// Method to get all the Allocated Content in the device
  Future<List<Map<String,dynamic>>> getAllocatedContent() async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceid = (await getId())!;
    try {
      Query _allocatedContent = FirebaseFirestore.instance.collection('Allocated_content').where("deviceUniqueId", isEqualTo: deviceid);
      List<DocumentSnapshot> _contentDocs = (await _allocatedContent.get()).docs;
      List<Map<String,dynamic>> _contentList = _contentDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _contentList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get the Allocated Content filtered by Gat in the device
  Future<List<Map<String,dynamic>>> getAllocatedContentByGat(String gat) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceid = (await getId())!;
    try {
      Query query = FirebaseFirestore.instance
          .collection('Allocated_content')
          .where("deviceUniqueId", isEqualTo: deviceid)
          .where("contentGat", isEqualTo: gat);
      List<DocumentSnapshot> _acharyaDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _studentsList = _acharyaDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _studentsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get the Allocated Content filtered by Date in the device
  Future<List<Map<String,dynamic>>> getAllocatedContentByDate(String date) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceid = (await getId())!;
    try {
      Query query = FirebaseFirestore.instance
          .collection('Allocated_content')
          .where("deviceUniqueId", isEqualTo: deviceid)
          .where("time", isEqualTo: date);
      List<DocumentSnapshot> _acharyaDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _studentsList = _acharyaDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _studentsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get the Allocated Content filtered by Gat and Date in the device
  Future<List<Map<String,dynamic>>> getAllocatedContentByGatAndDate(String gat, String date) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceid = (await getId())!;
    try {
      Query query = FirebaseFirestore.instance
          .collection('Allocated_content')
          .where("deviceUniqueId", isEqualTo: deviceid)
          .where("contentGat", isEqualTo: gat)
          .where("time", isEqualTo: date);
      List<DocumentSnapshot> _acharyaDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _studentsList = _acharyaDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _studentsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get the Allocated Content filtered by Gat and Month in the device
  Future<List<Map<String,dynamic>>> getAllocatedContentByGatAndMonth(String gat, String month) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceid = (await getId())!;
    try {
      Query query = FirebaseFirestore.instance
          .collection('Allocated_content')
          .where("deviceUniqueId", isEqualTo: deviceid)
          .where("contentGat", isEqualTo: gat);
      List<DocumentSnapshot> _acharyaDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _studentsList = _acharyaDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).where((element) {
        if(element["time"]!.contains("-$month-"))
          return true;
        return false;
      }).toList();
      return _studentsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to Allocated Content to a Gat in the device
  Future<void> allocateContent({required AllocatedContent allocatedContentDetails}) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('Allocated_content').doc(allocatedContentDetails.docId);
      await ref.set({
        'id': allocatedContentDetails.id,
        'contentName': allocatedContentDetails.contentName,
        'contentGat': allocatedContentDetails.contentGat,
        'contentSubject': allocatedContentDetails.contentSubject,
        'contentTopic': allocatedContentDetails.contentTopic,
        'time': allocatedContentDetails.time,
        'deviceUniqueId': allocatedContentDetails.deviceUniqueId,
        'synced': allocatedContentDetails.synced,
        'dateOfSync': allocatedContentDetails.dateOfSync,
        'docId': allocatedContentDetails.docId,
      });
      print("Content Allocated");
    } catch (e) {
      print(e.toString());
    }
  }

  /// Method to update Allocated Content Details in the device
  Future<void> updateAllocatedContent({required AllocatedContent allocatedContentDetails}) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('Allocated_content').doc(allocatedContentDetails.docId);
      await ref.update({
        'id': allocatedContentDetails.id,
        'contentName': allocatedContentDetails.contentName,
        'contentGat': allocatedContentDetails.contentGat,
        'contentSubject': allocatedContentDetails.contentSubject,
        'contentTopic': allocatedContentDetails.contentTopic,
        'time': allocatedContentDetails.time,
        'deviceUniqueId': allocatedContentDetails.deviceUniqueId,
        'synced': allocatedContentDetails.synced,
        'dateOfSync': allocatedContentDetails.dateOfSync,
        'docId': allocatedContentDetails.docId,
      });
      print("Content Allocated");
    } catch (e) {
      print(e.toString());
    }
  }

  /// Method to delete the Allocated Content in the device
  Future<void> deleteAllocatedContent({required String? id}) async {
    print(id);
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('Allocated_content').doc(id);
      await ref.delete();
      print("Content Deleted");
    } catch (e) {
      print(e.toString());
    }
  }
}
