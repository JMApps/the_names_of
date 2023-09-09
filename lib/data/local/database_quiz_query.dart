import 'package:sqflite/sqlite_api.dart';
import 'package:the_names_of/data/local/database_quiz_helper.dart';
import 'package:the_names_of/domain/models/question_model.dart';
import 'package:the_names_of/domain/models/quiz_model.dart';

class DatabaseQuizQuery {
  static final DatabaseQuizQuery _instance = DatabaseQuizQuery.internal();
  factory DatabaseQuizQuery() => _instance;
  DatabaseQuizQuery.internal();

  final DatabaseQuizHelper _databaseQuizHelper = DatabaseQuizHelper();
  late final Database database;

  static const String arRuTableName = 'Table_of_ar_ru_quiz';
  static const String ruArTableName = 'Table_of_ru_ar_quiz';

  Future<List<QuizModel>> getArabicQuiz() async {
    final Database database = await _databaseQuizHelper.db;
    final List<Map<String, dynamic>> resources = await database.query(arRuTableName);
    final List<QuizModel> quizList = [];

    for (final questionData in resources) {
      final List<String> options = [
        questionData['answer_a'],
        questionData['answer_b'],
        questionData['answer_c'],
        questionData['answer_d'],
      ];

      final QuestionModel questionModel = QuestionModel.fromMap(questionData);

      final QuizModel quizModel = QuizModel(
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

  Future<void> setArRuAnswer({required int answerId, required int answerState}) async {
    final Database database = await _databaseQuizHelper.db;
    await  database.rawQuery('UPDATE $arRuTableName SET answer_state = $answerState where id == $answerId');
  }

  Future<void> resetArRuAnswer() async {
    final Database database = await _databaseQuizHelper.db;
    await  database.rawQuery('UPDATE $arRuTableName SET answer_state = 0');
  }

  Future<List<Map<String, dynamic>>> getArRuTrueAnswers() async {
    final Database database = await _databaseQuizHelper.db;
    final List<Map<String, dynamic>> resources =  await database.query(arRuTableName, where: 'answer_state = 1');
    return resources;
  }

  Future<List<QuizModel>> getRussianQuiz() async {
    final Database database = await _databaseQuizHelper.db;
    final List<Map<String, dynamic>> resources = await database.query(ruArTableName);
    final List<QuizModel> quizList = [];

    for (final questionData in resources) {
      final List<String> options = [
        questionData['answer_a'],
        questionData['answer_b'],
        questionData['answer_c'],
        questionData['answer_d'],
      ];

      final QuestionModel questionModel = QuestionModel.fromMap(questionData);

      final QuizModel quizModel = QuizModel(
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

  Future<void> setRuArAnswer({required int answerId, required int answerState}) async {
    final Database database = await _databaseQuizHelper.db;
    await  database.rawQuery('UPDATE $ruArTableName SET answer_state = $answerState where id = $answerId');
  }

  Future<void> resetRuArAnswer() async {
    final Database database = await _databaseQuizHelper.db;
    await  database.rawQuery('UPDATE $ruArTableName SET answer_state = 0');
  }

  Future<List<Map<String, dynamic>>> getRuArTrueAnswers() async {
    final Database database = await _databaseQuizHelper.db;
    final List<Map<String, dynamic>> resources =  await database.query(ruArTableName, where: 'answer_state = 1');
    return resources;
  }
}