import '../../core/strings/database_values.dart';

class QuizModel {
  final int id;
  final String question;
  final List<String> answers;
  final int correct;
  final int answerState;

  const QuizModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.correct,
    required this.answerState,
  });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map[DatabaseValues.dbId] as int,
      question: map[DatabaseValues.dbQuestion] as String,
      answers: map[DatabaseValues.dbAnswers] as List<String>,
      correct: map[DatabaseValues.dbCorrect] as int,
      answerState: map[DatabaseValues.dbAnswerState] as int,
    );
  }
}
