class QuizModel {
  final int id;
  final String question;
  final List<String> answers;
  final int correct;
  final int answerState;

  QuizModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.correct,
    required this.answerState,
  });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] as int,
      question: map['question'] as String,
      answers: map['answers'] as List<String>,
      correct: map['correct'] as int,
      answerState: map['answer_state'] as int,
    );
  }
}
