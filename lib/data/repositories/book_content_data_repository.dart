import 'package:sqflite/sqflite.dart';

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
  final BookContentService _databaseHelper = BookContentService();

  final String _tableNames = 'Table_of_names';
  final String _tableAyahs = 'Table_of_ayahs';
  final String _tableContents = 'Table_of_contents';
  final String _tableClarifications = 'Table_of_clarifications';

  @override
  Future<List<NameEntity>> getAllNames() async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, Object?>> resources = await database.query(_tableNames);
    final List<NameEntity> allNames = resources.isNotEmpty ? resources.map((c) => _nameToEntity(NameModel.fromMap(c))).toList() : [];
    return allNames;
  }

  @override
  Future<List<NameEntity>> getChapterNames({required int chapterId}) async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, Object?>> resources = await database.query(_tableNames, where: 'sorted_by == $chapterId');
    final List<NameEntity> chapterNames = resources.isNotEmpty ? resources.map((c) => _nameToEntity(NameModel.fromMap(c))).toList() : [];
    return chapterNames;
  }

  @override
  Future<List<AyahEntity>> getChapterAyahs({required int chapterId}) async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, Object?>> resources = await database.query(_tableAyahs, where: 'sorted_by == $chapterId');
    final List<AyahEntity> chapterAyahs = resources.isNotEmpty ? resources.map((c) => _ayahToEntity(AyahModel.fromMap(c))).toList() : [];
    return chapterAyahs;
  }

  @override
  Future<List<ContentEntity>> getAllContents() async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, Object?>> resources = await database.query(_tableContents);
    final List<ContentEntity> allContents = resources.isNotEmpty ? resources.map((c) => _contentToEntity(ContentModel.fromMap(c))).toList() : [];
    return allContents;
  }

  @override
  Future<ContentEntity> getContentById({required int contentId}) async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, Object?>> resources = await database.query(_tableContents, where: 'id == $contentId');
    final ContentEntity? contentById = resources.isNotEmpty ? _contentToEntity(ContentModel.fromMap(resources.first)) : null;
    return contentById!;
  }

  @override
  Future<List<ClarificationEntity>> getAllClarifications() async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, Object?>> resources = await database.query(_tableClarifications);
    final List<ClarificationEntity> allClarifications = resources.isNotEmpty ? resources.map((c) => _clarificationToEntity(ClarificationModel.fromMap(c))).toList() : [];
    return allClarifications;
  }

  @override
  Future<ClarificationEntity> getClarificationById({required int clarificationId}) async {
    final Database database = await _databaseHelper.db;
    final List<Map<String, Object?>> resources = await database.query(_tableClarifications, where: 'id == $clarificationId');
    final ClarificationEntity? clarificationById = resources.isNotEmpty ? _clarificationToEntity(ClarificationModel.fromMap(resources.first)) : null;
    return clarificationById!;
  }

  NameEntity _nameToEntity(NameModel model) {
    return NameEntity(
      id: model.id,
      nameArabic: model.nameArabic,
      nameTranscription: model.nameTranscription,
      nameTranslation: model.nameTranslation,
      nameAudio: model.nameAudio,
    );
  }

  AyahEntity _ayahToEntity(AyahModel model) {
    return AyahEntity(
      id: model.id,
      ayahArabic: model.ayahArabic,
      ayahTranslation: model.ayahTranslation,
      ayahSource: model.ayahSource,
    );
  }

  ContentEntity _contentToEntity(ContentModel model) {
    return ContentEntity(
      id: model.id,
      contentNumber: model.contentNumber,
      contentTitle: model.contentTitle,
      content: model.content,
    );
  }

  ClarificationEntity _clarificationToEntity(ClarificationModel model) {
    return ClarificationEntity(
      id: model.id,
      title: model.title,
      clarification: model.clarification,
    );
  }
}
