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

  var _databaseQuery = DatabaseQuery();

  List<QuestionArabic> _arabicQuestions = QuestionArabic.sample_data
      .map(
        (question) => QuestionArabic(
      id: question['_id'],
      question: question['question'],
      options: question['options'],
      answer: question['answer_index'],
    ),
  )
      .toList();

  List<QuestionArabic> get arabicQuestions => this._arabicQuestions;

  late SharedPreferences _preferences;

  late PageController _pageArabicController;

  PageController get arabicPageController => this._pageArabicController;

  bool _isArabicAnswered = false;

  bool get isAnswered => this._isArabicAnswered;

  late int _correctArabicAnswer;

  int get correctArabicAnswer => this._correctArabicAnswer;

  late int _selectedArabicAnswer;

  int get selectedArabicAnswer => this._selectedArabicAnswer;

  RxInt _questionArabicNumber = 1.obs;

  RxInt get questionArabicNumber => this._questionArabicNumber;

  int _numberOfCorrectArabicAnswer = 0;

  int get numberOfCorrectArabicAnswer => this._numberOfCorrectArabicAnswer;

  int _trueArabicAnswerCount = 0;

  int get trueArabicAnswerCount => this._trueArabicAnswerCount;

  @override
  void onInit() async {
    _pageArabicController = PageController(initialPage: questionArabicNumber.value + 1);
    _preferences = await SharedPreferences.getInstance();
    _pageArabicController.jumpToPage(_preferences.getInt(keyLastArabicPage) ?? 0);
    if (_preferences.getInt(keyLastArabicPage) == _arabicQuestions.length) {
      Get.to(() => ScoreArabicPage(), preventDuplicates:false);
    }
    _trueArabicAnswerCount = _preferences.getInt(keyTrueArabicAnswer) ?? 0;
    super.onInit();
  }

  @override
  void onClose() {
    _pageArabicController.dispose();
    dispose();
    super.onClose();
  }

  saveAnswer(int selectedIndex) {
    if (selectedArabicAnswer == _correctArabicAnswer) {
      _preferences.setInt(keyTrueArabicAnswer, _trueArabicAnswerCount++);
      _databaseQuery.changeArabicAnswerState(0, _questionArabicNumber.value);
    } else {
      _databaseQuery.changeArabicAnswerState(1, _questionArabicNumber.value);
    }
  }

  checkAnswer(QuestionArabic question, int selectedIndex) {
    _preferences.setInt(keyLastArabicPage, _questionArabicNumber.value);
    _isArabicAnswered = true;
    _correctArabicAnswer = question.answer!;
    _selectedArabicAnswer = selectedIndex;
    update();

    Future.delayed(
      Duration(milliseconds: selectedArabicAnswer == _correctArabicAnswer ? 1500 : 3500),
      () {
        if (_correctArabicAnswer == _selectedArabicAnswer) {
          _numberOfCorrectArabicAnswer++;
        }
        nextQuestion();
      },
    );
  }

  nextQuestion() {
    if (_questionArabicNumber.value != _arabicQuestions.length) {
      _isArabicAnswered = false;
      _pageArabicController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      Get.to(() => ScoreArabicPage(), preventDuplicates: false);
    }
  }

  updateQuestionNumber(int index) {
    _questionArabicNumber.value = index + 1;
  }

  bool checkForLast() {
    return _preferences.getInt(keyLastArabicPage) == 99 ? true : false;
  }

  shareResult() {
    Share.share(
      'Я ответил правильно на $_trueArabicAnswerCount из 99 вопросов в арабско-русской версии викторины об именах Аллаха',
    );
  }

  resetQuiz() async {
    _isArabicAnswered = false;
    _trueArabicAnswerCount = 0;
    _questionArabicNumber.value = 0;
    await _preferences.setInt(keyLastArabicPage, 0);
    await _preferences.setInt(keyTrueArabicAnswer, 0);
    _databaseQuery.resetArabicAnswerState();
    _pageArabicController.jumpToPage(0);
    update();
  }
}