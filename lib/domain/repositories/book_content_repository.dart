import '../entities/ayah_entity.dart';
import '../entities/clarification_entity.dart';
import '../entities/content_entity.dart';
import '../entities/name_entity.dart';

abstract class BookContentRepository {
  Future<List<ContentEntity>> getAllContents();

  Future<ContentEntity> getContentById({required int contentId});

  Future<List<NameEntity>> getAllNames();

  Future<List<NameEntity>> getChapterNames({required int chapterId});

  Future<List<AyahEntity>> getChapterAyahs({required int chapterId});

  Future<List<ClarificationEntity>> getAllClarifications();

  Future<ClarificationEntity> getClarificationById({required int clarificationId});
}
