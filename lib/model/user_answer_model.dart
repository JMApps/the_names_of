class UserAnswer {
  int? questionId;
  String? answered;
  bool? isCorrect;

  UserAnswer({this.questionId, this.answered, this.isCorrect});

  Map toJson() => {
    'questionId': questionId,
    'answered': answered,
    'correct': isCorrect,
  };
}