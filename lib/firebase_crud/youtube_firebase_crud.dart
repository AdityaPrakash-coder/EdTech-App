import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iitpal_acharya_ui/models/youtube_video.dart';



class YoutubeVideoCRUD {
  /// Method to add Questions to a Quiz in the device
  Future<void> uploadVideo(YoutubeVideoModel youtubeVideoModel) async{
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    try {
      DocumentReference ref = _fireStore.collection('Youtube_vidoes').doc(youtubeVideoModel.id);
      await ref.set({
        "id":youtubeVideoModel.id,
        "videoid":youtubeVideoModel.videoid,
        "topic":youtubeVideoModel.topic,
        "dateofSync":youtubeVideoModel.dateofSync
      });
      print("Video Allocated");
    }catch(e){
      print(e.toString());
    }
  }

  /// Method to get Question IDs of a given Quiz ID in the device
  Future<List<Map<String,dynamic>>> getVideos() async {
    try {
      CollectionReference _youtubeVideos =
      FirebaseFirestore.instance.collection('Youtube_vidoes');
      List<DocumentSnapshot> _quizQuestionsDocs = (await _youtubeVideos.get()).docs;
      List<Map<String,dynamic>> _youtubevideosList =
      _quizQuestionsDocs.map((e) => Map<String,dynamic>.from((e.data() as Map))).toList();
      print(_youtubevideosList);
      return _youtubevideosList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// Method to delete the Quiz Questions by given ID in the device
  Future<void> deleteVideoById(String id) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings.persistenceEnabled;
    try {
      DocumentReference ref = _fireStore.collection('Youtube_vidoes').doc(id);
      await ref.delete();
      print("video Deleted");
    }catch(e){
      print(e.toString());
    }
  }
}