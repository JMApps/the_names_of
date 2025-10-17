import '../../core/strings/database_values.dart';

class QuestionModel {
  final int id;
  final String question;
  final String answerA;
  final String answerB;
  final String answerC;
  final String answerD;
  final int correct;
  final int answerState;

  const QuestionModel({
    required this.id,
    required this.question,
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.correct,
    required this.answerState,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map[DatabaseValues.dbId] as int,
      question: map[DatabaseValues.dbQuestion] as String,
      answerA: map[DatabaseValues.dbAnswerA] as String,
      answerB: map[DatabaseValues.dbAnswerB] as String,
      answerC: map[DatabaseValues.dbAnswerC] as String,
      answerD: map[DatabaseValues.dbAnswerD] as String,
      correct: map[DatabaseValues.dbCorrect] as int,
      answerState: map[DatabaseValues.dbAnswerState] as int,
    );
  }
}
