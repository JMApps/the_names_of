class NameItem {
  int? id;
  String? nameArabic;
  String? nameTranscription;
  String? nameTranslation;
  String? nameAudio;
  int? answerState;

  NameItem(this.id, this.nameArabic, this.nameTranscription,
      this.nameTranslation, this.nameAudio, this.answerState);

  NameItem.fromMap(dynamic obj) {
    this.id = obj['_id'];
    this.nameArabic = obj['name_arabic'];
    this.nameTranscription = obj['name_transcription'];
    this.nameTranslation = obj['name_translation'];
    this.nameAudio = obj['name_audio'];
    this.answerState = obj['answer_state'];
  }
}
