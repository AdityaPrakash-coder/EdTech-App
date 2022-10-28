import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:iitpal_acharya_ui/models/content_details_model.dart';
import 'package:iitpal_acharya_ui/screens/unique_key_device.dart';

class ContentDetailsService {
  /// Method to add Content Details in the device
  Future<void> addContentDetails(ContentDetails contentDetails) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String id = (await getId())!;
    String uid = UniqueKey().toString().substring(2, 7) + id;
    try {
      DocumentReference ref = _firestore.collection('Content_Details').doc(uid);
      await ref.set({
        'id': contentDetails.id,
        'name': contentDetails.videoName,
        'gat': contentDetails.gat,
        'sub': contentDetails.subject,
        'topic': contentDetails.topic,
        'ver': contentDetails.version,
        'dateOfLastModification': contentDetails.dateOfLastModification,
        'path': contentDetails.videoPath,
      });
    } catch (e) {
      print(e.toString());
    }
  }
  /// Method to get All the Content in the device
  Future<List<ContentDetails>> getAllContent() async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      CollectionReference _content = FirebaseFirestore.instance.collection('Content_Details');
      List<DocumentSnapshot> _contentDocs = (await _content.get()).docs;
      List<ContentDetails> _contentsList = _contentDocs.map((e) => ContentDetails.fromMap(e.data() as Map)).toList();
      print(_contentsList);
      return _contentsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
  ///Method to get Content filtered by Id in the device
  Future<List<ContentDetails>> getContentById(String id) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      Query _content = FirebaseFirestore.instance.collection('Content_Details').where("id", isEqualTo: id);
      List<DocumentSnapshot> _contentDocs = (await _content.get()).docs;
      List<ContentDetails> _contentsList = _contentDocs.map((e) => ContentDetails.fromMap(e.data() as Map)).toList();
      print(_contentsList);
      return _contentsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
  /// Method to get Content filtered by Gat in the device
  Future<List<ContentDetails>> getContentByGat(String gat) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      Query _content = FirebaseFirestore.instance.collection('Content_Details').where("gat", isEqualTo: gat);
      List<DocumentSnapshot> _contentDocs = (await _content.get()).docs;
      List<ContentDetails> _contentsList = _contentDocs.map((e) => ContentDetails.fromMap(e.data() as Map)).toList();
      print(_contentsList);
      return _contentsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
  /// Method to get content filtered by Gat and Topic in the device
  Future<List<ContentDetails>> getContentByGatTopic(String gat, String topic) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      Query _content =
          FirebaseFirestore.instance.collection('Content_Details').where("gat", isEqualTo: gat).where("topic", isEqualTo: topic);
      List<DocumentSnapshot> _contentDocs = (await _content.get()).docs;
      List<ContentDetails> _contentsList = _contentDocs.map((e) => ContentDetails.fromMap(e.data() as Map)).toList();
      print(_contentsList);
      return _contentsList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

/*Future get_appUse_field(var key)async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String? id = await getId();
    DocumentSnapshot sp =await _firestore.collection('user_data').doc(id).get();
    var app = sp.get(key);

  }
*/

}
