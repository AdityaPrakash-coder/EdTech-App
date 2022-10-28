class VideoWatchedDetails {
  final String Subject;
  final String Topic;
  final String Gat;
  final String totalWatchedTime;
  final String total_video_length;
  final String id;
  final String deviceUniqueId;
  final String synced;
  final String dateOfSync;

  VideoWatchedDetails({required this.synced, required this.dateOfSync,
      required this.Gat,
      required this.Subject,
      required this.Topic,
      required this.totalWatchedTime,
      required this.total_video_length,
      required this.id,
      required this.deviceUniqueId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Gat': Gat,
      'Subject': Subject,
      'Topic': Topic,
      'totalWatchedTime': totalWatchedTime,
      'total_video_length': total_video_length,
      'deviceUniqueId': deviceUniqueId,
      'synced': synced,
      'dateOfSync': dateOfSync,
    };
  }

  factory VideoWatchedDetails.fromMap(Map<dynamic, dynamic> map) {
    return VideoWatchedDetails(
        synced: map["synced"],
        dateOfSync: map["dateOfSync"],
        id: map["id"],
        deviceUniqueId: map["deviceUniqueId"],
        Gat: map["Gat"],
        Subject: map["Subject"],
      Topic: map["Topic"],
      totalWatchedTime: map["total_Watched_Time"],
      total_video_length: map["total_video_length"]
    );
  }

  @override
  String toString() {
    return 'VideoWatched : { VideoId: $id,Gat: $Gat, Subject: $Subject, Topic: $Topic, totalWatchedTime:$totalWatchedTime,total_video_length:$total_video_length, deviceUniqueid: $deviceUniqueId}';
  }
}
