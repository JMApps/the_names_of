import '../entities/quiz_entity.dart';

abstract class QuizRepository {
  Future<List<QuizEntity>> getArabicQuiz();

  Future<void> setArRuAnswer({required int answerId, required int answerState});

  Future<void> resetArRuAnswer();

  Future<List<Map<String, dynamic>>> getArRuTrueAnswers();

  Future<List<QuizEntity>> getRussianQuiz();

  Future<void> setRuArAnswer({required int answerId, required int answerState});

  Future<void> resetRuArAnswer();

  Future<List<Map<String, dynamic>>> getRuArTrueAnswers();
}
