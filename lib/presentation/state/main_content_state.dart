import 'package:flutter/material.dart';

import '../../domain/entities/ayah_entity.dart';
import '../../domain/entities/clarification_entity.dart';
import '../../domain/entities/content_entity.dart';
import '../../domain/entities/name_entity.dart';
import '../../domain/usecases/book_content_use_case.dart';

class MainContentState extends ChangeNotifier {

  final BookContentUseCase _bookContentUseCase;

  MainContentState(this._bookContentUseCase);

  Future<List<ContentEntity>> getAllContents() async {
    return _bookContentUseCase.fetchAllContents();
  }

  Future<ContentEntity> getContentById({required int contentId}) async {
    return _bookContentUseCase.fetchContentById(contentId: contentId);
  }

  Future<List<NameEntity>> getAllNames() async {
    return _bookContentUseCase.fetchAllNames();
  }

  Future<List<NameEntity>> getChapterNames({required int chapterId}) async {
    return _bookContentUseCase.fetchChapterNames(chapterId: chapterId);
  }

  Future<List<AyahEntity>> getChapterAyahs({required int chapterId}) async {
    return _bookContentUseCase.fetchChapterAyahs(chapterId: chapterId);
  }

  Future<List<ClarificationEntity>> getAllClarifications() async {
    return _bookContentUseCase.fetchAllClarifications();
  }

  Future<ClarificationEntity> getClarificationById({required int clarificationId}) async {
    return _bookContentUseCase.fetchClarificationById(clarificationId: clarificationId);
  }
}