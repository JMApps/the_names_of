class QuizEntity {
  final int id;
  final String question;
  final List<String> answers;
  final int correct;
  final int answerState;

  QuizEntity({
    required this.id,
    required this.question,
    required this.answers,
    required this.correct,
    required this.answerState,
  });
}
