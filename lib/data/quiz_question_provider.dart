import 'package:sqflite/sqflite.dart';

class QuizQuestions {
  int? id;
  String? question;
  String? answerA;
  String? answerB;
  String? answerC;
  String? answerD;
  String? isCorrect;
  String? nameAudio;
  int? categoryId;

  Map<String, dynamic>? toMap() {
    var map = <String, dynamic>{
      '_id': id,
      'question': question,
      'answer_a': answerA,
      'answer_b': answerB,
      'answer_c': answerC,
      'answer_d': answerD,
      'correct': isCorrect,
      'name_audio': nameAudio,
      'category_id': categoryId,
    };
    return map;
  }

  QuizQuestions();

  QuizQuestions.fromMap(Map<String, dynamic> map) {
    id = map['_id'];
    question = map['question'];
    answerA = map['answer_a'];
    answerB = map['answer_b'];
    answerC = map['answer_c'];
    answerD = map['answer_d'];
    isCorrect = map['correct'];
    nameAudio = map['name_audio'];
    categoryId = map['category_id'];
  }
}

class QuestionProvider {
  Future<QuizQuestions?> getQuestionById(Database db, int id) async {
    var maps = await db.query('Table_of_quiz_questions',
        columns: [
          '_id',
          'question',
          'answer_a',
          'answer_b',
          'answer_c',
          'answer_d',
          'correct',
          'name_audio',
          'category_id',
        ],
        where: '_id = ?',
        whereArgs: [id]);
    if (maps.length > 0) return QuizQuestions.fromMap(maps.first);
    return null;
  }

  Future<List<QuizQuestions>?> getQuestionByCategoryId(
      Database db, int id) async {
    var maps = await db.query('Table_of_quiz_questions',
        columns: [
          '_id',
          'question',
          'answer_a',
          'answer_b',
          'answer_c',
          'answer_d',
          'correct',
          'name_audio',
          'category_id',
        ],
        where: 'category_id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return maps.map((question) => QuizQuestions.fromMap(question)).toList();
    } else {
      return null;
    }
  }

  Future<List<QuizQuestions>?> getQuestions(Database db) async {
    var maps = await db.query('Table_of_quiz_questions',
        columns: [
          '_id',
          'question',
          'answer_a',
          'answer_b',
          'answer_c',
          'answer_d',
          'correct',
          'name_audio',
          'category_id',
        ],
        limit: 30,
        orderBy: 'Random()');
    if (maps.length > 0) {
      return maps.map((question) => QuizQuestions.fromMap(question)).toList();
    } else {
      return null;
    }
  }
}
