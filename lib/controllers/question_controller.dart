import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_names_of/model/question.dart';
import 'package:the_names_of/score/score_page.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late Animation _animation;

  Animation get animation => this._animation;

  late PageController _pageController;

  PageController get pageController => this._pageController;

  List<Question> _questions = Question.sample_data
      .map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          options: question['options'],
          answer: question['answer_index'],
        ),
      )
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;

  bool get isAnswered => this._isAnswered;

  late int _correctAnswer;

  int get correctAnswer => this._correctAnswer;

  late int _selectedAnswer;

  int get selectedAnswer => this._selectedAnswer;

  RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => this._questionNumber;

  int _numberOfCorrectAnswer = 0;

  int get numberOfCorrectAnswer => this._numberOfCorrectAnswer;

  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }

  checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer!;
    _selectedAnswer = selectedIndex;
    if (_correctAnswer == _selectedAnswer) {
      _numberOfCorrectAnswer++;
    }

    update();

    Future.delayed(
      Duration(seconds: 3),
      () {
        nextQuestion();
      },
    );
  }

  nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      Get.to(ScorePage());
    }
  }

  updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
