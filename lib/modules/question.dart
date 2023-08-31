// dart class
class Question {

  final String question;
  final String answer;
  Question({required this.question, required this.answer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['Question'],
      answer: json['Answer'],
    );
  }
}