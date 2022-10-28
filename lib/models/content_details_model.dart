class ContentDetails {
  final String id;
  String videoName;
  String gat;
  String subject;
  String topic;
  String version;
  String dateOfLastModification;
  String videoPath;

  ContentDetails(
      {required this.id,
        required this.videoName,
        required this.gat,
        required this.subject,
        required this.topic,
        required this.version,
        required this.dateOfLastModification,
        required this.videoPath,});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': videoName,
      'gat': gat,
      'sub': subject,
      'topic': topic,
      'ver': version,
      'dateOfLastModification': dateOfLastModification,
      'path': videoPath,
    };
  }

  @override
  String toString() {
    return 'ContentDetails : {id: $id, videoName: $videoName, gat: $gat subject: $subject, topic: $topic, Question: $version, A: $dateOfLastModification, B: $videoPath\n';
  }
  factory ContentDetails.fromMap(Map<dynamic, dynamic> map) {
    return ContentDetails(version: map["ver"], id: map["id"], topic: map["topic"], gat: map["gat"], dateOfLastModification: map["dateOfLastModification"], videoPath: map["path"], subject: map["sub"], videoName: map["name"]);

  }
}