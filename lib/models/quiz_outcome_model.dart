class QuizOutcome{
  String studentID;
  String quizID;
  String docID;
  int score;
  int maxMarks;
  int timeTaken;
  String deviceUniqueId;
  final String synced;
  final String dateOfSync;

  QuizOutcome({required this.synced,required this.dateOfSync,
    required this.studentID,
    required this.quizID,
    required this.docID,
    required this.score,
    required this.maxMarks,
    required this.timeTaken,
    required this.deviceUniqueId
  });

  Map<String, dynamic> toMap() {
    return {
      'studentID' : studentID,
      'quizID': quizID,
      'docID': docID,
      'score': score,
      'maxMarks': maxMarks,
      'timeTaken': timeTaken,
      'deviceUniqueId': deviceUniqueId,
      'synced': synced,
      'dateOfSync': dateOfSync,
    };
  }

  @override
  String toString() {
    return 'QuizOutcome : {studentID: $studentID, quizID: $quizID, docID: $docID, score: $score, maxMarks: $maxMarks, timeTaken: $timeTaken, deviceUniqueId: $deviceUniqueId}';
  }
}