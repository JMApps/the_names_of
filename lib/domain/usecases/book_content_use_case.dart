import '../entities/ayah_entity.dart';
import '../entities/clarification_entity.dart';
import '../entities/content_entity.dart';
import '../entities/name_entity.dart';
import '../repositories/book_content_repository.dart';

class BookContentUseCase {

  final BookContentRepository _bookContentRepository;

  BookContentUseCase(this._bookContentRepository);

  Future<List<ContentEntity>> fetchAllContents() async {
    try {
      final List<ContentEntity> allContents = await _bookContentRepository.getAllContents();
      return allContents;
    } catch (e) {
      throw Exception('Error get all contents \n\n${e.toString()}');
    }
  }

  Future<ContentEntity> fetchContentById({required int contentId}) async {
    try {
      final ContentEntity contentById = await _bookContentRepository.getContentById(contentId: contentId);
      return contentById;
    } catch (e) {
      throw Exception('Error get content by id \n\n${e.toString()}');
    }
  }

  Future<List<NameEntity>> fetchAllNames() async {
    try {
      final List<NameEntity> allNames = await _bookContentRepository.getAllNames();
      return allNames;
    } catch (e) {
      throw Exception('Error get all names \n\n${e.toString()}');
    }
  }

  Future<List<NameEntity>> fetchChapterNames({required int chapterId}) async {
    try {
      final List<NameEntity> chapterNames = await _bookContentRepository.getChapterNames(chapterId: chapterId);
      return chapterNames;
    } catch (e) {
      throw Exception('Error get chapter names \n\n${e.toString()}');
    }
  }

  Future<List<AyahEntity>> fetchChapterAyahs({required int chapterId}) async {
    try {
      final List<AyahEntity> chapterAyahs = await _bookContentRepository.getChapterAyahs(chapterId: chapterId);
      return chapterAyahs;
    } catch (e) {
      throw Exception('Error get chapter ayahs \n\n${e.toString()}');
    }
  }

  Future<List<ClarificationEntity>> fetchAllClarifications() async {
    try {
      final List<ClarificationEntity> allClarifications = await _bookContentRepository.getAllClarifications();
      return allClarifications;
    } catch (e) {
      throw Exception('Error get all clarifications \n\n${e.toString()}');
    }
  }

  Future<ClarificationEntity> fetchClarificationById({required int clarificationId}) async {
    try {
      final ClarificationEntity clarificationById = await _bookContentRepository.getClarificationById(clarificationId: clarificationId);
      return clarificationById;
    } catch (e) {
      throw Exception('Error get clarification by id \n\n${e.toString()}');
    }
  }
}