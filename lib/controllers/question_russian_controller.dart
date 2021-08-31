import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_names_of/components/constants.dart';
import 'package:the_names_of/data/database_query.dart';
import 'package:the_names_of/model/question_russian.dart';
import 'package:the_names_of/score/score_arabic_page.dart';

class QuestionRussianController extends GetxController
    with SingleGetTickerProviderMixin {

  var _databaseQuery = DatabaseQuery();

  List<QuestionRussian> _russianQuestions = QuestionRussian.sample_data
      .map(
        (question) => QuestionRussian(
      id: question['_id'],
      question: question['question'],
      options: question['options'],
      answer: question['answer_index'],
    ),
  )
      .toList();

  List<QuestionRussian> get russianQuestions => this._russianQuestions;

  late SharedPreferences _preferences;

  late PageController _russianPageController;

  PageController get russianPageController => this._russianPageController;

  bool _isRussianAnswered = false;

  bool get isRussianAnswered => this._isRussianAnswered;

  late int _correctRussianAnswer;

  int get correctRussianAnswer => this._correctRussianAnswer;

  late int _selectedRussianAnswer;

  int get selectedRussianAnswer => this._selectedRussianAnswer;

  RxInt _questionRussianNumber = 1.obs;

  RxInt get questionRussianNumber => this._questionRussianNumber;

  int _numberOfCorrectRussianAnswer = 0;

  int get numberOfCorrectRussianAnswer => this._numberOfCorrectRussianAnswer;

  int _trueRussianAnswerCount = 0;

  int get trueRussianAnswerCount => this._trueRussianAnswerCount;

  @override
  void onInit() async {
    _russianPageController = PageController(initialPage: questionRussianNumber.value + 1);
    _preferences = await SharedPreferences.getInstance();
    _russianPageController.jumpToPage(_preferences.getInt(keyLastRussianPage) ?? 0);
    if (_preferences.getInt(keyLastRussianPage) == _russianQuestions.length) {
      Get.to(() => ScoreArabicPage(), preventDuplicates: false);
    }
    _trueRussianAnswerCount = _preferences.getInt(keyTrueRussianAnswer) ?? 0;
    super.onInit();
  }

  @override
  void onClose() {
    _russianPageController.dispose();
    dispose();
    super.onClose();
  }

  saveAnswer(int selectedIndex) {
    if (selectedRussianAnswer == _correctRussianAnswer) {
      _preferences.setInt(keyTrueRussianAnswer, _trueRussianAnswerCount++);
      _databaseQuery.changeRussianAnswerState(0, _questionRussianNumber.value);
    } else {
      _databaseQuery.changeRussianAnswerState(1, _questionRussianNumber.value);
    }
  }

  checkAnswer(QuestionRussian question, int selectedIndex) {
    _preferences.setInt(keyLastRussianPage, _questionRussianNumber.value);
    _isRussianAnswered = true;
    _correctRussianAnswer = question.answer!;
    _selectedRussianAnswer = selectedIndex;
    update();

    Future.delayed(
      Duration(milliseconds: selectedRussianAnswer == _correctRussianAnswer ? 1500 : 3500),
      () {
        if (_correctRussianAnswer == _selectedRussianAnswer) {
          _numberOfCorrectRussianAnswer++;
        }
        nextQuestion();
      },
    );
  }

  nextQuestion() {
    if (_questionRussianNumber.value != _russianQuestions.length) {
      _isRussianAnswered = false;
      _russianPageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      Get.to(() => ScoreArabicPage(), preventDuplicates: false);
    }
  }

  updateQuestionNumber(int index) {
    _questionRussianNumber.value = index + 1;
  }

  bool checkForLast() {
    return _preferences.getInt(keyLastRussianPage) == 99 ? true : false;
  }

  shareResult() {
    Share.share(
      'Я ответил правильно на $_trueRussianAnswerCount из 99 вопросов в русско-арабской версии викторины об именах Аллаха',
    );
  }

  resetQuiz() async {
    _isRussianAnswered = false;
    _trueRussianAnswerCount = 0;
    _questionRussianNumber.value = 0;
    await _preferences.setInt(keyLastRussianPage, 0);
    await _preferences.setInt(keyTrueRussianAnswer, 0);
    _databaseQuery.resetArabicAnswerState();
    _russianPageController.jumpToPage(0);
    update();
  }
}