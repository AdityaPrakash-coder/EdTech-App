import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iitpal_acharya_ui/screens/unique_key_device.dart';

import '../models/video_watched_model.dart';
import '../screens/unique_key_device.dart';

class VideoWatchedDataService {
  /// Method to get all Video Watched Data in the device
  Future<List<Map<String, dynamic>>> getAllRowsList() async {
    String deviceid = (await getId())!;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      Query _allVideoWatched = FirebaseFirestore.instance.collection(
          'VideoWatchedData').where("deviceUniqueId", isEqualTo: deviceid);
      List<DocumentSnapshot> _acharyaDocs = (await _allVideoWatched.get()).docs;

      List<VideoWatchedDetails> _videoWatchedDetailslist =
      _acharyaDocs.map((e) => VideoWatchedDetails.fromMap(e.data() as Map))
          .toList();
      print(_videoWatchedDetailslist);
      List<Map<String, dynamic>> tempList = [];
      for (var x in _videoWatchedDetailslist) {
        tempList.add(x.toMap());
      }
      return tempList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to add new Video Watched Data in the device
  Future<void> insertNewRaw(
      {required VideoWatchedDetails videoWatchedDetails}) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      //String uid = videoWatchedDetails.id + videoWatchedDetails.deviceUniqueId;
      DocumentReference ref = _fireStore.collection('VideoWatchedData').doc(
          videoWatchedDetails.id);
      await ref.set({
        'id': videoWatchedDetails.id,
        'Gat': videoWatchedDetails.Gat,
        'Subject': videoWatchedDetails.Subject,
        'Topic': videoWatchedDetails.Topic,
        'totalWatchedTime': videoWatchedDetails.totalWatchedTime,
        'total_video_length': videoWatchedDetails.total_video_length,
        'deviceUniqueId': videoWatchedDetails.deviceUniqueId,
        'synced': videoWatchedDetails.synced,
        'dateOfSync': videoWatchedDetails.dateOfSync,
      });
      print("video watched data Added");
    } catch (e) {
      print(e.toString());
    }
  }

  /// Method to get Video Watched Data by given Gat in the device
  Future<List<Map<String, dynamic>>> getVideoWatchedByGat(String gat) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceid = (await getId())!;
    try {
      Query query =
      FirebaseFirestore.instance.collection('VideoWatchedData').where(
          "deviceUniqueId", isEqualTo: deviceid).where("Gat",isEqualTo: gat);
      List<DocumentSnapshot> _acharyaDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _videoWatched=_acharyaDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      return _videoWatched;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to get Video Watched Data by given Video ID in the device
  Future<List<Map<String, dynamic>>> getVideoWatchedByVideoId(String id) async {
    FirebaseFirestore.instance.settings.persistenceEnabled;
    String deviceid = (await getId())!;
    try {
      Query query =
      FirebaseFirestore.instance.collection('VideoWatchedData').where(
          "deviceUniqueId", isEqualTo: deviceid).where("id",isEqualTo: id);
      List<DocumentSnapshot> _acharyaDocs = (await query.get()).docs;
      List<Map<String,dynamic>> _videoWatched=_acharyaDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      print(_videoWatched);
      return _videoWatched;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to update Video Watched Details in the device
  Future<void> updateRowById(VideoWatchedDetails videoWatchedDetails) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('VideoWatchedData').doc(
          videoWatchedDetails.id);
      await ref.set({
        'id': videoWatchedDetails.id,
        'Gat': videoWatchedDetails.Gat,
        'Subject': videoWatchedDetails.Subject,
        'Topic': videoWatchedDetails.Topic,
        'totalWatchedTime': videoWatchedDetails.totalWatchedTime,
        'total_video_length': videoWatchedDetails.total_video_length,
        'deviceUniqueId': videoWatchedDetails.deviceUniqueId,
        'synced': videoWatchedDetails.synced,
        'dateOfSync': videoWatchedDetails.dateOfSync,
      });
      print("Video watched detail updated");
    } catch (e) {
      print(e.toString());
    }
  }
}

/* Future<void> updateRowById(VideoWatchedDetails videoWatchedDetails) async {
      FirebaseFirestore _fireStore = FirebaseFirestore.instance;
      FirebaseFirestore.instance.settings.persistenceEnabled;
      try {
        DocumentReference ref = _fireStore.collection('VideoWatchedData').doc(
            videoWatchedDetails.id);
        await ref.update({
          'id': videoWatchedDetails.id,
          'Gat': videoWatchedDetails.Gat,
          'Subject': videoWatchedDetails.Subject,
          'Topic': videoWatchedDetails.Topic,
          'totalWatchedTime': videoWatchedDetails.totalWatchedTime,
          'total_video_length': videoWatchedDetails.total_video_length,
          'deviceUniqueId': videoWatchedDetails.deviceUniqueId,
          'synced': videoWatchedDetails.synced,
          'dateOfSync': videoWatchedDetails.dateOfSync,
        });
        print("Video watched detail updated");
      } catch (e) {
        print(e.toString());
      }
    }
*/
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
    // }*/


