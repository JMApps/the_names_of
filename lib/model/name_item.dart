class NameItem {
  int? _id;
  String? _nameArabic;
  String? _nameTranscription;
  String? _nameTranslation;
  String? _nameAudio;

  NameItem(this._id, this._nameArabic, this._nameTranscription,
      this._nameTranslation, this._nameAudio);

  NameItem.fromMap(dynamic obj) {
    this._id = obj['_id'];
    this._nameArabic = obj['name_arabic'];
    this._nameTranscription = obj['name_transcription'];
    this._nameTranslation = obj['name_translation'];
    this._nameAudio = obj['name_audio'];
  }
}
