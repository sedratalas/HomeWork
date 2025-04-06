class QuizModel{
String question;
List<Answer> answer;

QuizModel({
    required this.question,
    required this.answer,
  });
}
class Answer{
  String answer;
  bool isCorrect;

  Answer({
    required this.answer,
    required this.isCorrect,
  });
}