import 'package:the_names_of/data/database_helper.dart';
import 'package:the_names_of/model/ayah_item.dart';
import 'package:the_names_of/model/content_item.dart';
import 'package:the_names_of/model/name_item.dart';
import 'package:the_names_of/model/quiz_item.dart';
import 'package:the_names_of/model/tafsir_item.dart';

class DatabaseQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<List<NameItem>> getAllNames() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_names');
    List<NameItem>? allNames = res.isNotEmpty ? res.map((c) => NameItem.fromMap(c)).toList() : null;
    return allNames!;
  }

  Future<List<NameItem>> getFavoriteNames() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_names', where: 'favorite == 0');
    List<NameItem>? favoriteNames = res.isNotEmpty ? res.map((c) => NameItem.fromMap(c)).toList() : null;
    return favoriteNames!;
  }

  Future<List<NameItem>> getChapterNames(int id) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_names', where: 'sorted_by == $id');
    List<NameItem>? allNames = res.isNotEmpty ? res.map((c) => NameItem.fromMap(c)).toList() : null;
    return allNames!;
  }

  Future<List<AyahItem>> getChapterAyahs(int id) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_ayahs', where: 'sorted_by == $id');
    List<AyahItem>? chapterAyahs = res.isNotEmpty ? res.map((c) => AyahItem.fromMap(c)).toList() : null;
    return chapterAyahs!;
  }

  Future<List<TafsirItem>> getAllChapterTafsirs() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_tafsirs');
    List<TafsirItem>? chapterTafsir = res.isNotEmpty ? res.map((c) => TafsirItem.fromMap(c)).toList() : null;
    return chapterTafsir!;
  }

  Future<List<TafsirItem>> getChapterTafsirs(int id) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_tafsirs', where: '_id == $id');
    List<TafsirItem>? chapterTafsir = res.isNotEmpty ? res.map((c) => TafsirItem.fromMap(c)).toList() : null;
    return chapterTafsir!;
  }

  Future<List<ContentItem>> getAllContents() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_contents');
    List<ContentItem>? content = res.isNotEmpty ? res.map((c) => ContentItem.fromMap(c)).toList() : null;
    return content!;
  }

  Future<List<ContentItem>> getChapterContents(int id) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_contents', where: '_id == $id');
    List<ContentItem>? content = res.isNotEmpty ? res.map((c) => ContentItem.fromMap(c)).toList() : null;
    return content!;
  }

  Future<List<QuizItem>> getArabicQuizNames() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_arabic_names_quiz');
    List<QuizItem>? arabicQuiz = res.isNotEmpty ? res.map((c) => QuizItem.fromMap(c)).toList() : null;
    return arabicQuiz!;
  }

  Future<List<QuizItem>> getRussianQuizNames() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_russian_names_quiz');
    List<QuizItem>? russianQuiz = res.isNotEmpty ? res.map((c) => QuizItem.fromMap(c)).toList() : null;
    return russianQuiz!;
  }

  changeArabicAnswerState(int state, int _id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_arabic_names_quiz SET answer_state = $state WHERE _id == $_id');
  }

  resetArabicAnswerState() async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_arabic_names_quiz SET answer_state = NULL');
  }


  changeRussianAnswerState(int state, int _id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_russian_names_quiz SET answer_state = $state WHERE _id == $_id');
  }

  resetRussianAnswerState() async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_russian_names_quiz SET answer_state = NULL');
  }
}