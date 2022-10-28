class StudentDetails {
  String? id;
  String? studentName;
  String? studentGat;
  int? studentAge;
  String? deviceUniqueId;
  String? synced;
  String? dateOfSync;

  StudentDetails(
      {required this.synced,
      required this.dateOfSync,
      required this.id,
      required this.studentName,
      required this.studentGat,
      required this.studentAge,
      required this.deviceUniqueId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': studentName,
      'gat': studentGat,
      'age': studentAge,
      'deviceUniqueId': deviceUniqueId,
      'synced': synced,
      'dateOfSync': dateOfSync,
    };
  }

  @override
  String toString() {
    return 'Student : {id: $id, name: $studentName, gat: $studentGat, age: $studentAge,deviceUniqueId: $deviceUniqueId}';
  }

  factory StudentDetails.fromMap(Map<dynamic, dynamic> map) {
    return StudentDetails(
        synced: map["synced"],
        dateOfSync: map["dateOfSync"],
        id: map["id"],
        studentName: map["name"],
        studentGat: map["gat"],
        studentAge: map["age"],
        deviceUniqueId: map["deviceUniqueId"]);
  }

}
