class QuizQuestions{
  String quizId;
  String questionId;
  String deviceUniqueId;
  final String synced;
  final String dateOfSync;

  QuizQuestions({required this.synced,required this.dateOfSync,
    required this.quizId,
    required this.questionId,
    required this.deviceUniqueId,
  });

  Map<String, dynamic> toMap() {
    return {
      'quizId': quizId,
      'questionId': questionId,
      'deviceUniqueId': deviceUniqueId,
      'synced': synced,
      'dateOfSync': dateOfSync,
    };
  }

  @override
  String toString() {
    return 'Quiz_questions : {quizID: $quizId, questionID: $questionId, deviceUniqueId: $deviceUniqueId}';
  }
}