import '../../data/models/name_model.dart';

class NameEntity {
  final int id;
  final String nameArabic;
  final String nameTranscription;
  final String nameTranslation;
  final String nameAudio;

  const NameEntity({
    required this.id,
    required this.nameArabic,
    required this.nameTranscription,
    required this.nameTranslation,
    required this.nameAudio,
  });

  factory NameEntity.fromModel(NameModel model) {
    return NameEntity(
      id: model.id,
      nameArabic: model.nameArabic,
      nameTranscription: model.nameTranscription,
      nameTranslation: model.nameTranslation,
      nameAudio: model.nameAudio,
    );
  }
}
