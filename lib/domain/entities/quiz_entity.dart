import '../../data/models/quiz_model.dart';

class QuizEntity {
  final int id;
  final String question;
  final List<String> answers;
  final int correct;
  final int answerState;

  const QuizEntity({
    required this.id,
    required this.question,
    required this.answers,
    required this.correct,
    required this.answerState,
  });

  factory QuizEntity.fromModel(QuizModel model) {
    return QuizEntity(
      id: model.id,
      question: model.question,
      answers: model.answers,
      correct: model.correct,
      answerState: model.answerState,
    );
  }
}
