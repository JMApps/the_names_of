import '../../core/strings/database_values.dart';

class ContentModel {
  final int id;
  final String contentNumber;
  final String contentTitle;
  final String content;

  const ContentModel({
    required this.id,
    required this.contentNumber,
    required this.contentTitle,
    required this.content,
  });

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    return ContentModel(
      id: map[DatabaseValues.dbId] as int,
      contentNumber: map[DatabaseValues.dbContentNumber] as String,
      contentTitle: map[DatabaseValues.dbContentTitle] as String,
      content: map[DatabaseValues.dbContent] as String,
    );
  }
}
