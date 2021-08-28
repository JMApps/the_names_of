import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_names_of/model/question.dart';
import 'package:the_names_of/score/score_page.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
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

  late SharedPreferences _preferences;

  SharedPreferences get preferences => this._preferences;

  int _trueAnswerCount = 0;

  int get trueAnswerCount => this._trueAnswerCount;

  @override
  void onInit() async {
    _pageController = PageController();
    _preferences = await SharedPreferences.getInstance();
    _pageController.jumpToPage(preferences.getInt('last_page_view_page') ?? 0);
    if (preferences.getInt('last_page_view_page') == _questions.length) {
      Get.to(ScorePage());
    }
    _trueAnswerCount = preferences.getInt('key_true_answer') ?? 0;
    print('$_trueAnswerCount');
    super.onInit();
  }

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }

  saveAnswer(int selectedIndex) {
    if (selectedAnswer == _correctAnswer) {
      preferences.setInt('key_true_answer', _trueAnswerCount++);
    }
  }

  checkAnswer(Question question, int selectedIndex) {
    preferences.setInt('last_page_view_page', _questionNumber.value);
    _isAnswered = true;
    _correctAnswer = question.answer!;
    _selectedAnswer = selectedIndex;
    update();

    Future.delayed(
      Duration(seconds: 3),
      () {
        if (_correctAnswer == _selectedAnswer) {
          _numberOfCorrectAnswer++;
        }
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

  bool checkForLast() {
    return preferences.getInt('last_page_view_page') == 99 ? true : false;
  }

  shareResult() {
    Share.share(
      'Я ответил правильно по именам Аллаха на $_trueAnswerCount вопросов из 99',
    );
  }

  resetQuiz() {
    _isAnswered = false;
    preferences.remove('last_page_view_page');
    preferences.remove('key_true_answer');
    _pageController.jumpToPage(0);
    update();
  }
}
