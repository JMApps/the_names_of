class QuizItem {
  int? id;
  String? question;
  String? answerA;
  String? answerB;
  String? answerC;
  String? answerD;
  String? correct;
  int? answerState;

  QuizItem(this.id, this.question, this.answerA, this.answerB, this.answerC,
      this.answerD, this.correct, this.answerState);

  QuizItem.fromMap(dynamic obj) {
    this.id = obj['_id'];
    this.question = obj['question'];
    this.answerA = obj['answer_a'];
    this.answerB = obj['answer_b'];
    this.answerC = obj['answer_c'];
    this.answerD = obj['answer_d'];
    this.correct = obj['correct'];
    this.answerState = obj['answer_state'];
  }
}
