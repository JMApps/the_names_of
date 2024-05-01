class ClarificationModel {
  final int id;
  final String title;
  final String clarification;

  ClarificationModel({
    required this.id,
    required this.title,
    required this.clarification,
  });

  factory ClarificationModel.fromMap(Map<String, dynamic> map) {
    return ClarificationModel(
      id: map['id'] as int,
      title: map['clarification_title'] as String,
      clarification: map['clarification_content'] as String,
    );
  }
}
