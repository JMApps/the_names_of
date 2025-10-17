import '../../core/strings/database_values.dart';

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
      id: map[DatabaseValues.dbId] as int,
      nameArabic: map[DatabaseValues.dbNameArabic] as String,
      nameTranscription: map[DatabaseValues.dbNameTranscription] as String,
      nameTranslation: map[DatabaseValues.dbNameTranslation] as String,
      nameAudio: map[DatabaseValues.dbNameAudio] as String,
    );
  }
}
