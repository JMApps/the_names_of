class ContentItem {
  int? id;
  String? contentNumber;
  String? contentTitle;
  String? content;

  ContentItem.fromMap(dynamic obj) {
    this.id = obj['_id'];
    this.contentNumber = obj['content_number'];
    this.contentTitle = obj['content_title'];
    this.content = obj['content'];
  }
}