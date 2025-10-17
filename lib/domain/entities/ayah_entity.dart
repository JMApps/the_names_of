
import '../../data/models/ayah_model.dart';

class AyahEntity {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;

  const AyahEntity({
    required this.id,
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
  });

  factory AyahEntity.fromModel(AyahModel model) {
    return AyahEntity(
      id: model.id,
      ayahArabic: model.ayahArabic,
      ayahTranslation: model.ayahTranslation,
      ayahSource: model.ayahSource,
    );
  }
}
