import 'package:sqflite/sqlite_api.dart';

import '../../core/strings/database_values.dart';
import '../../domain/entities/quiz_entity.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../models/question_model.dart';
import '../services/quiz_service.dart';

class QuizDataRepository implements QuizRepository {
  final QuizService _quizService;

  const QuizDataRepository(this._quizService);

  @override
  Future<List<QuizEntity>> getArabicQuiz() async {
    final Database database = await _quizService.db;
    final List<Map<String, dynamic>> resources = await database.query(DatabaseValues.dbArRuTableName);
    final List<QuizEntity> quizList = [];

    for (final questionData in resources) {
      final List<String> options = [
        questionData[DatabaseValues.dbAnswerA],
        questionData[DatabaseValues.dbAnswerB],
        questionData[DatabaseValues.dbAnswerC],
        questionData[DatabaseValues.dbAnswerD],
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
    await database.update(DatabaseValues.dbArRuTableName, { DatabaseValues.dbAnswerState: answerState }, where: '${DatabaseValues.dbId} = ?', whereArgs: [answerId]);
  }

  @override
  Future<void> resetArRuAnswer() async {
    final Database database = await _quizService.db;
    await database.update(DatabaseValues.dbArRuTableName, { DatabaseValues.dbAnswerState : 0 });
  }

  @override
  Future<List<Map<String, dynamic>>> getArRuTrueAnswers() async {
    final Database database = await _quizService.db;
    final List<Map<String, dynamic>> resources = await database.query(DatabaseValues.dbArRuTableName, where: '${DatabaseValues.dbAnswerState} = ?', whereArgs: [1]);
    return resources;
  }

  @override
  Future<List<QuizEntity>> getRussianQuiz() async {
    final Database database = await _quizService.db;
    final List<Map<String, dynamic>> resources = await database.query(DatabaseValues.dbRuArTableName);
    final List<QuizEntity> quizList = [];

    for (final questionData in resources) {
      final List<String> options = [
        questionData[DatabaseValues.dbAnswerA],
        questionData[DatabaseValues.dbAnswerB],
        questionData[DatabaseValues.dbAnswerC],
        questionData[DatabaseValues.dbAnswerD],
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
    await database.update(DatabaseValues.dbRuArTableName, { DatabaseValues.dbAnswerState : answerState}, where: '${DatabaseValues.dbId} = ?', whereArgs: [answerId]);
  }

  @override
  Future<void> resetRuArAnswer() async {
    final Database database = await _quizService.db;
    await database.update(DatabaseValues.dbRuArTableName, { DatabaseValues.dbAnswerState: 0 });
  }

  @override
  Future<List<Map<String, dynamic>>> getRuArTrueAnswers() async {
    final Database database = await _quizService.db;
    final List<Map<String, dynamic>> resources = await database.query(DatabaseValues.dbRuArTableName, where: '${DatabaseValues.dbAnswerState} = ?', whereArgs: [1]);
    return resources;
  }
}
