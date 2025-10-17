import '../../core/strings/database_values.dart';

class AyahModel {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;

  const AyahModel({
    required this.id,
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
  });

  factory AyahModel.fromMap(Map<String, dynamic> map) {
    return AyahModel(
      id: map[DatabaseValues.dbId] as int,
      ayahArabic: map[DatabaseValues.dbAyahArabic] as String,
      ayahTranslation: map[DatabaseValues.dbAyahTranslation] as String,
      ayahSource: map[DatabaseValues.dbAyahSource] as String,
    );
  }
}
