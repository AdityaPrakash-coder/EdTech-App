class DateWiseRecord{
  final String date;
  final String gat;
  final String deviceUniqueId;
  DateWiseRecord({required this.date, required this.gat, required this.deviceUniqueId});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'gat': gat,
      'deviceUniqueId': deviceUniqueId,
    };
  }
  factory DateWiseRecord.fromMap(Map<dynamic, dynamic> map) {
    return DateWiseRecord(
      date: map["date"],
      gat: map['gat'],
      deviceUniqueId: map["deviceUniqueId"],
    );
  }
}