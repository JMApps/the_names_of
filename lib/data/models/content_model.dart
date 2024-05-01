class ContentModel {
  final int id;
  final String contentNumber;
  final String contentTitle;
  final String content;

  ContentModel({
    required this.id,
    required this.contentNumber,
    required this.contentTitle,
    required this.content,
  });

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    return ContentModel(
      id: map['id'] as int,
      contentNumber: map['content_number'] as String,
      contentTitle: map['content_title'] as String,
      content: map['content'] as String,
    );
  }
}
