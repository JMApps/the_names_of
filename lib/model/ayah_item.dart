class AyahItem {
  int? id;
  String? ayahArabic;
  String? ayahTranslation;
  String? ayahSource;

  AyahItem(this.id, this.ayahArabic, this.ayahTranslation, this.ayahSource);

  AyahItem.fromMap(dynamic obj) {
    this.id = obj['_id'];
    this.ayahArabic = obj['ayah_arabic'];
    this.ayahTranslation = obj['ayah_translation'];
    this.ayahSource = obj['ayah_source'];
  }
}