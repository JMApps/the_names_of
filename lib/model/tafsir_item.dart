class TafsirItem {
  int? id;
  String? tafsirTitle;
  String? tafsirContent;
  int? favorite;
  String? forShare;

  TafsirItem(this.id, this.tafsirTitle, this.tafsirContent, this.favorite, this.forShare);

  TafsirItem.fromMap(dynamic obj) {
    this.id = obj['_id'];
    this.tafsirTitle = obj['tafsir_title'];
    this.tafsirContent = obj['tafsir_content'];
    this.favorite = obj['favorite'];
    this.forShare = obj['for_share'];
  }
}