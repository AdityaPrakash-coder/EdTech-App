
class QuizAllocationSchedule {
  final String quizId;
  String quizGat;
  String quizDate;
  int quizTime;
  String deviceUniqueId;
  final String synced;
  final String dateOfSync;

  QuizAllocationSchedule({required this.synced,required this.dateOfSync,
      required this.quizId,
        required this.quizGat,
        required this.quizDate,
        required this.quizTime,
      required this.deviceUniqueId});

  Map<String, dynamic> toMap() {
    return {
      'id': quizId,
      'gat': quizGat,
      'date': quizDate,
      'time': quizTime,
      'deviceUniqueId': deviceUniqueId,
      'synced': synced,
      'dateOfSync': dateOfSync,
    };
  }

  @override
  String toString() {
    return 'Student : {quizId: $quizId, name: $quizGat, gat: $quizDate, age: $quizTime, deviceUniqueId: $deviceUniqueId}';
  }
}
