import 'package:sqflite/sqflite.dart';

import '../../core/strings/database_values.dart';
import '../../domain/entities/ayah_entity.dart';
import '../../domain/entities/clarification_entity.dart';
import '../../domain/entities/content_entity.dart';
import '../../domain/entities/name_entity.dart';
import '../../domain/repositories/book_content_repository.dart';
import '../models/ayah_model.dart';
import '../models/clarification_model.dart';
import '../models/content_model.dart';
import '../models/name_model.dart';
import '../services/book_content_service.dart';

class BookContentDataRepository implements BookContentRepository {

  final BookContentService _bookContentService;

  const BookContentDataRepository(this._bookContentService);

  @override
  Future<List<NameEntity>> getAllNames() async {
    final Database database = await _bookContentService.db;
    final List<Map<String, Object?>> resources = await database.query(DatabaseValues.dbTableNames);
    final List<NameEntity> allNames = resources.isNotEmpty ? resources.map((c) => NameEntity.fromModel(NameModel.fromMap(c))).toList() : [];
    return allNames;
  }

  @override
  Future<List<NameEntity>> getChapterNames({required int chapterId}) async {
    final Database database = await _bookContentService.db;
    final List<Map<String, Object?>> resources = await database.query(DatabaseValues.dbTableNames, where: '${DatabaseValues.dbSortedBy} = ?', whereArgs: [chapterId]);
    final List<NameEntity> chapterNames = resources.isNotEmpty ? resources.map((c) => NameEntity.fromModel(NameModel.fromMap(c))).toList() : [];
    return chapterNames;
  }

  @override
  Future<List<AyahEntity>> getChapterAyahs({required int chapterId}) async {
    final Database database = await _bookContentService.db;
    final List<Map<String, Object?>> resources = await database.query(DatabaseValues.dbTableAyahs, where: '${DatabaseValues.dbSortedBy} = ?', whereArgs: [chapterId]);
    final List<AyahEntity> chapterAyahs = resources.isNotEmpty ? resources.map((c) => AyahEntity.fromModel(AyahModel.fromMap(c))).toList() : [];
    return chapterAyahs;
  }

  @override
  Future<List<ContentEntity>> getAllContents() async {
    final Database database = await _bookContentService.db;
    final List<Map<String, Object?>> resources = await database.query(DatabaseValues.dbTableContents);
    final List<ContentEntity> allContents = resources.isNotEmpty ? resources.map((c) => ContentEntity.fromModel(ContentModel.fromMap(c))).toList() : [];
    return allContents;
  }

  @override
  Future<ContentEntity> getContentById({required int contentId}) async {
    final Database database = await _bookContentService.db;
    final List<Map<String, Object?>> resources = await database.query(DatabaseValues.dbTableContents, where: '${DatabaseValues.dbId} = ?', whereArgs: [contentId]);
    final ContentEntity? contentById = resources.isNotEmpty ? ContentEntity.fromModel(ContentModel.fromMap(resources.first)) : null;
    return contentById!;
  }

  @override
  Future<List<ClarificationEntity>> getAllClarifications() async {
    final Database database = await _bookContentService.db;
    final List<Map<String, Object?>> resources = await database.query(DatabaseValues.dbTableClarifications);
    final List<ClarificationEntity> allClarifications = resources.isNotEmpty ? resources.map((c) => ClarificationEntity.fromModel(ClarificationModel.fromMap(c))).toList() : [];
    return allClarifications;
  }

  @override
  Future<ClarificationEntity> getClarificationById({required int clarificationId}) async {
    final Database database = await _bookContentService.db;
    final List<Map<String, Object?>> resources = await database.query(DatabaseValues.dbTableClarifications, where: '${DatabaseValues.dbId} = ?', whereArgs: [clarificationId]);
    final ClarificationEntity? clarificationById = resources.isNotEmpty ? ClarificationEntity.fromModel(ClarificationModel.fromMap(resources.first)) : null;
    return clarificationById!;
  }
}
