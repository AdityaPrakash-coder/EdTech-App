class AllocatedContent {
  String id;
  String contentName;
  String contentGat;
  String contentSubject;
  String contentTopic;
  String time;
  String deviceUniqueId;
  String synced;
  String dateOfSync;
  String docId;

  AllocatedContent(
      {required this.synced,
      required this.dateOfSync,
      required this.id,
      required this.contentName,
      required this.contentGat,
      required this.contentSubject,
      required this.contentTopic,
      required this.time,
      required this.deviceUniqueId,
      required this.docId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'contentName': contentName,
      'contentGat': contentGat,
      'contentSubject': contentSubject,
      'contentTopic': contentTopic,
      'time': time,
      'deviceUniqueId': deviceUniqueId,
      'synced': synced,
      'dateOfSync': dateOfSync,
      'docId': docId,
    };
  }

  @override
  String toString() {
    return 'Allocated_Content : {id: $id, Name: $contentName Gat: $contentGat, Subject: $contentSubject, Topic: $contentTopic,Date of Allocation: $time,deviceUniqueId: $deviceUniqueId, docId: $docId}';
  }

  factory AllocatedContent.fromMap(Map<dynamic, dynamic> map) {
    return AllocatedContent(
        synced: map["synced"],
        dateOfSync: map["dateOfSync"],
        id: map["id"],
        contentName: map["contentName"],
        contentGat: map["contentGat"],
        contentSubject: map["contentSubject"],
        contentTopic: map["contentTopic"],
        time: map["time"],
        deviceUniqueId: map["deviceUniqueId"],
        docId: map["docId"]);
  }
}
