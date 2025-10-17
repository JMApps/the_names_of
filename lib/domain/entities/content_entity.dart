import '../../data/models/content_model.dart';

class ContentEntity {
  final int id;
  final String contentNumber;
  final String contentTitle;
  final String content;

  const ContentEntity({
    required this.id,
    required this.contentNumber,
    required this.contentTitle,
    required this.content,
  });

  factory ContentEntity.fromModel(ContentModel model) {
    return ContentEntity(
      id: model.id,
      contentNumber: model.contentNumber,
      contentTitle: model.contentTitle,
      content: model.content,
    );
  }
}
