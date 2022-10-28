import 'package:flutter/material.dart';

class QuestionDetails {
  final String id;
  String questionGat;
  String questionSubject;
  String questionTopic;
  String question;
  String a;
  String b;
  String c;
  String d;
  String answer;
  String deviceUniqueId;
  final String synced;
  final String dateOfSync;

  QuestionDetails({required this.synced,required this.dateOfSync,
      required this.id,
        required this.questionGat,
        required this.questionSubject,
        required this.questionTopic,
        required this.question,
        required this.a,
        required this.b,
        required this.c,
        required this.d,
        required this.answer,
      required this.deviceUniqueId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gat': questionGat,
      'sub': questionSubject,
      'topic': questionTopic,
      'question': question,
      'a': a,
      'b': b,
      'c': c,
      'd': d,
      'ans': answer,
      'deviceUniqueId': deviceUniqueId,
      'synced': synced,
      'dateOfSync': dateOfSync,
    };
  }

  @override
  String toString() {
    return 'QuestionDetails : {id: $id, gat: $questionGat, subject: $questionSubject, topic: $questionTopic, \nQuestion: $question,\nA: $a,\nB: $b,\nC: $c,\nD: $d\nanswer: $answer}\ndeviceUniqueId $deviceUniqueId';
  }

  factory QuestionDetails.fromMap(Map<dynamic, dynamic> map) {
    return QuestionDetails(
        synced: map["synced"],
        dateOfSync: map["dateOfSync"],
        id: map["id"],
        questionGat: map["gat"],
        questionSubject: map["sub"],
        questionTopic: map["topic"],
        question: map["question"],
        a: map["a"],
        b: map["b"],
        c: map["c"],
        d: map["d"],
        answer: map["ans"],
        deviceUniqueId: map["deviceUniqueId"]);
  }
}