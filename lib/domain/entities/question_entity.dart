import '../../data/models/question_model.dart';

class QuestionEntity {
  final int id;
  final String question;
  final String answerA;
  final String answerB;
  final String answerC;
  final String answerD;
  final int correct;
  final int answerState;

  const QuestionEntity({
    required this.id,
    required this.question,
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.correct,
    required this.answerState,
  });

  factory QuestionEntity.fromModel(QuestionModel model) {
    return QuestionEntity(
      id: model.id,
      question: model.question,
      answerA: model.answerA,
      answerB: model.answerB,
      answerC: model.answerC,
      answerD: model.answerD,
      correct: model.correct,
      answerState: model.answerState,
    );
  }
}
