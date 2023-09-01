class QuizModel {
  final int id;
  final String question;
  final String answerA;
  final String answerB;
  final String answerC;
  final String answerD;
  final String correct;
  final int answerState;

  QuizModel({
    required this.id,
    required this.question,
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.correct,
    required this.answerState,
  });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] as int,
      question: map['question'] as String,
      answerA: map['answer_a'] as String,
      answerB: map['answer_b'] as String,
      answerC: map['answer_c'] as String,
      answerD: map['answer_d'] as String,
      correct: map['correct'] as String,
      answerState: map['answer_state'] as int,
    );
  }
}
