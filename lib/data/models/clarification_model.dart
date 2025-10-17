import '../../core/strings/database_values.dart';

class ClarificationModel {
  final int id;
  final String title;
  final String clarification;

  const ClarificationModel({
    required this.id,
    required this.title,
    required this.clarification,
  });

  factory ClarificationModel.fromMap(Map<String, dynamic> map) {
    return ClarificationModel(
      id: map[DatabaseValues.dbId] as int,
      title: map[DatabaseValues.dbClarificationTitle] as String,
      clarification: map[DatabaseValues.dbClarificationContent] as String,
    );
  }
}
