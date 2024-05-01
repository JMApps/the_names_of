import 'package:sqflite/sqlite_api.dart';

import '../../domain/entities/quiz_entity.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../models/question_model.dart';
import '../services/quiz_service.dart';

class QuizDataRepository implements QuizRepository {
  final QuizService _quizService = QuizService();

  final String arRuTableName = 'Table_of_ar_ru_quiz';
  final String ruArTableName = 'Table_of_ru_ar_quiz';

  @override
  Future<List<QuizEntity>> getArabicQuiz() async {
    final Database database = await _quizService.db;
    final List<Map<String, dynamic>> resources = await database.query(arRuTableName);
    final List<QuizEntity> quizList = [];

    for (final questionData in resources) {
      final List<String> options = [
        questionData['answer_a'],
        questionData['answer_b'],
        questionData['answer_c'],
        questionData['answer_d'],
      ];

      final QuestionModel questionModel = QuestionModel.fromMap(questionData);

      final QuizEntity quizModel = QuizEntity(
        id: questionModel.id,
        question: questionModel.question,
        answers: options,
        correct: questionModel.correct,
        answerState: questionModel.answerState,
      );
      quizList.add(quizModel);
    }
    return quizList;
  }

  @override
  Future<void> setArRuAnswer({required int answerId, required int answerState}) async {
    final Database database = await _quizService.db;
    await database.rawQuery('UPDATE $arRuTableName SET answer_state = $answerState where id == $answerId');
  }

  @override
  Future<void> resetArRuAnswer() async {
    final Database database = await _quizService.db;
    await database.rawQuery('UPDATE $arRuTableName SET answer_state = 0');
  }

  @override
  Future<List<Map<String, dynamic>>> getArRuTrueAnswers() async {
    final Database database = await _quizService.db;
    final List<Map<String, dynamic>> resources = await database.query(arRuTableName, where: 'answer_state = 1');
    return resources;
  }

  @override
  Future<List<QuizEntity>> getRussianQuiz() async {
    final Database database = await _quizService.db;
    final List<Map<String, dynamic>> resources = await database.query(ruArTableName);
    final List<QuizEntity> quizList = [];

    for (final questionData in resources) {
      final List<String> options = [
        questionData['answer_a'],
        questionData['answer_b'],
        questionData['answer_c'],
        questionData['answer_d'],
      ];

      final QuestionModel questionModel = QuestionModel.fromMap(questionData);

      final QuizEntity quizModel = QuizEntity(
        id: questionModel.id,
        question: questionModel.question,
        answers: options,
        correct: questionModel.correct,
        answerState: questionModel.answerState,
      );
      quizList.add(quizModel);
    }
    return quizList;
  }

  @override
  Future<void> setRuArAnswer({required int answerId, required int answerState}) async {
    final Database database = await _quizService.db;
    await database.rawQuery('UPDATE $ruArTableName SET answer_state = $answerState where id = $answerId');
  }

  @override
  Future<void> resetRuArAnswer() async {
    final Database database = await _quizService.db;
    await database.rawQuery('UPDATE $ruArTableName SET answer_state = 0');
  }

  @override
  Future<List<Map<String, dynamic>>> getRuArTrueAnswers() async {
    final Database database = await _quizService.db;
    final List<Map<String, dynamic>> resources = await database.query(ruArTableName, where: 'answer_state = 1');
    return resources;
  }
}
