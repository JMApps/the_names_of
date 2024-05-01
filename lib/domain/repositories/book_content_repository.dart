import '../models/ayah_entity.dart';
import '../models/clarification_entity.dart';
import '../models/content_entity.dart';
import '../models/name_entity.dart';

abstract class BookContentRepository {
  Future<List<ContentEntity>> getAllContents();

  Future<ContentEntity> getContentById({required int contentId});

  Future<List<NameEntity>> getAllNames();

  Future<List<NameEntity>> getChapterNames({required int chapterId});

  Future<List<AyahEntity>> getChapterAyahs({required int chapterId});

  Future<List<ClarificationEntity>> getAllClarifications();

  Future<ClarificationEntity> getClarificationById({required int clarificationId});
}
