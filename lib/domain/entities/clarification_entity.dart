import '../../data/models/clarification_model.dart';

class ClarificationEntity {
  final int id;
  final String title;
  final String clarification;

  const ClarificationEntity({
    required this.id,
    required this.title,
    required this.clarification,
  });

  factory ClarificationEntity.fromModel(ClarificationModel model) {
    return ClarificationEntity(
      id: model.id,
      title: model.title,
      clarification: model.clarification,
    );
  }
}
