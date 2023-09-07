import 'package:sqflite/sqflite.dart';
import 'package:the_names_of/data/local/database_helper.dart';
import 'package:the_names_of/domain/models/ayah_model.dart';
import 'package:the_names_of/domain/models/clarification_model.dart';
import 'package:the_names_of/domain/models/content_model.dart';
import 'package:the_names_of/domain/models/name_model.dart';

class DatabaseQuery {
  static final DatabaseQuery _instance = DatabaseQuery.internal();
  factory DatabaseQuery() => _instance;
  DatabaseQuery.internal();

  final DatabaseHelper _databaseHelper = DatabaseHelper();
  late final Database database;

  Future<List<NameModel>> getAllNames() async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, dynamic>> resources = await database.query('Table_of_names');
    List<NameModel>? allNames = resources.isNotEmpty ? resources.map((c) => NameModel.fromMap(c)).toList() : null;
    return allNames!;
  }

  Future<List<NameModel>> getFavoriteNames({required List<int> favoriteIds}) async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, dynamic>> resources = await database.query('Table_of_names', where: 'id IN (${favoriteIds.map((id) => '?').join(', ')})', whereArgs: favoriteIds);
    List<NameModel>? favoriteNames = resources.isNotEmpty ? resources.map((c) => NameModel.fromMap(c)).toList() : null;
    return favoriteNames!;
  }

  Future<List<NameModel>> getChapterNames({required int chapterId}) async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, dynamic>> resources = await database.query('Table_of_names', where: 'sorted_by == $chapterId');
    List<NameModel>? chapterNames = resources.isNotEmpty ? resources.map((c) => NameModel.fromMap(c)).toList() : null;
    return chapterNames!;
  }

  Future<List<AyahModel>> getChapterAyahs({ required int chapterId}) async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, dynamic>> resources = await database.query('Table_of_ayahs', where: 'sorted_by == $chapterId');
    List<AyahModel>? chapterAyahs = resources.isNotEmpty ? resources.map((c) => AyahModel.fromMap(c)).toList() : null;
    return chapterAyahs!;
  }

  Future<List<ContentModel>> getAllContents() async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, dynamic>> resources = await database.query('Table_of_contents');
    List<ContentModel>? contents = resources.isNotEmpty ? resources.map((c) => ContentModel.fromMap(c)).toList() : null;
    return contents!;
  }

  Future<List<ContentModel>> getOneContent({required int contentId}) async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, dynamic>> resources = await database.query('Table_of_contents', where: 'id == $contentId');
    List<ContentModel>? oneContent = resources.isNotEmpty ? resources.map((c) => ContentModel.fromMap(c)).toList() : null;
    return oneContent!;
  }

  Future<List<ClarificationModel>> getAllClarifications() async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, dynamic>> resources = await database.query('Table_of_clarifications');
    List<ClarificationModel>? allClarifications = resources.isNotEmpty ? resources.map((c) => ClarificationModel.fromMap(c)).toList() : null;
    return allClarifications!;
  }

  Future<List<ClarificationModel>> getOneClarification({required int clarificationId}) async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, dynamic>> resources = await database.query('Table_of_clarifications', where: 'id == $clarificationId');
    List<ClarificationModel>? oneClarification = resources.isNotEmpty ? resources.map((c) => ClarificationModel.fromMap(c)).toList() : null;
    return oneClarification!;
  }
}
