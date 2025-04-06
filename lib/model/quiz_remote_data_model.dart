import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizModel {
  String questionText;
  List<Answer> options;
  QuizModel({
    required this.questionText,
    required this.options,
  });

  QuizModel copyWith({
    String? questionText,
    List<Answer>? options,
  }) {
    return QuizModel(
      questionText: questionText ?? this.questionText,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questionText': questionText,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      questionText: map['questionText'] as String,
      options: List<Answer>.from((map['options'] as List<dynamic>).map<Answer>((x) => Answer.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuizModel(questionText: $questionText, options: $options)';

  @override
  bool operator ==(covariant QuizModel other) {
    if (identical(this, other)) return true;

    return
      other.questionText == questionText &&
          listEquals(other.options, options);
  }

  @override
  int get hashCode => questionText.hashCode ^ options.hashCode;
}

class Answer {
  String answerText;
  bool isCorrcet;
  Answer({
    required this.answerText,
    required this.isCorrcet,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'answerText': answerText,
      'isCorrcet': isCorrcet,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      answerText: map['answerText'] as String,
      isCorrcet: map['isCorrcet'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source) as Map<String, dynamic>);
}