import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_names_of/components/constants.dart';
import 'package:the_names_of/data/database_query.dart';
import 'package:the_names_of/model/question_arabic.dart';
import 'package:the_names_of/score/score_arabic_page.dart';

class QuestionArabicController extends GetxController
    with SingleGetTickerProviderMixin {
  late PageController _pageController;

  var _databaseQuery = DatabaseQuery();

  PageController get pageController => this._pageController;

  List<QuestionArabic> _questions = QuestionArabic.sample_data
      .map(
        (question) => QuestionArabic(
          id: question['_id'],
          question: question['question'],
          options: question['options'],
          answer: question['answer_index'],
        ),
      )
      .toList();

  List<QuestionArabic> get questions => this._questions;

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
    _pageController.jumpToPage(preferences.getInt(keyLastArabicPage) ?? 0);
    if (preferences.getInt(keyLastArabicPage) == _questions.length) {
      Get.to(ScoreArabicPage());
    }
    _trueAnswerCount = preferences.getInt(keyTrueArabicAnswer) ?? 0;
    super.onInit();
  }

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }

  saveAnswer(int selectedIndex) {
    if (selectedAnswer == _correctAnswer) {
      preferences.setInt(keyTrueArabicAnswer, _trueAnswerCount++);
      _databaseQuery.changeArabicAnswerState(0, _questionNumber.value);
    } else {
      _databaseQuery.changeArabicAnswerState(1, _questionNumber.value);
    }
  }

  checkAnswer(QuestionArabic question, int selectedIndex) {
    preferences.setInt(keyLastArabicPage, _questionNumber.value);
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
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      Get.to(ScoreArabicPage());
    }
  }

  updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }

  bool checkForLast() {
    return preferences.getInt(keyLastArabicPage) == 99 ? true : false;
  }

  shareResult() {
    Share.share(
      'Я ответил правильно по именам Аллаха на $_trueAnswerCount вопросов из 99',
    );
  }

  resetQuiz() async {
    _isAnswered = false;
    await preferences.setInt(keyLastArabicPage, 0);
    await preferences.setInt(keyTrueArabicAnswer, 0);
    _databaseQuery.resetArabicAnswerState();
    _trueAnswerCount = 0;
    _questionNumber.value = 0;
    _pageController.jumpToPage(0);
    update();
  }
}