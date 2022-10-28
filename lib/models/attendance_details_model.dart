class AttendanceDetails{
  final String id;
  final String date;
  late final String Attendance;
  final String deviceUniqueId;
  final String synced;
  final String dateOfSync;

  AttendanceDetails({required this.synced,required this.dateOfSync,required this.id , required this.date, required this.Attendance, required this.deviceUniqueId});
  factory AttendanceDetails.fromMap(Map<dynamic, dynamic> map) {
    return AttendanceDetails(
      id: map["id"],
      date: map["date"],
      Attendance: map["Attendance"],
      deviceUniqueId: map["deviceUniqueId"],
      synced: map["synced"],
      dateOfSync: map["dateOfSync"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'Attendance': Attendance,
      'deviceUniqueId': deviceUniqueId,
      'synced': synced,
      'dateOfSync': dateOfSync,
    };
  }
}