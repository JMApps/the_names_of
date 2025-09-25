class NameModel {
  final int id;
  final String nameArabic;
  final String nameTranscription;
  final String nameTranslation;
  final String nameAudio;

  const NameModel({
    required this.id,
    required this.nameArabic,
    required this.nameTranscription,
    required this.nameTranslation,
    required this.nameAudio,
  });

  factory NameModel.fromMap(Map<String, dynamic> map) {
    return NameModel(
      id: map['id'] as int,
      nameArabic: map['name_arabic'] as String,
      nameTranscription: map['name_transcription'] as String,
      nameTranslation: map['name_translation'] as String,
      nameAudio: map['name_audio'] as String,
    );
  }
}
