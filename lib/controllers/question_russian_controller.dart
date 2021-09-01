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

  late int _trueRussianAnswerCount;

  int get trueRussianAnswerCount => this._trueRussianAnswerCount;

  late int _lastRussianPage;

  int get lastRussianPage => this._lastRussianPage;

  @override
  void onInit() async {
    _russianPageController = PageController();
    jumpToPageState();
    super.onInit();
  }

  @override
  void onClose() {
    _russianPageController.dispose();
    super.onClose();
  }

  jumpToPageState() async {
    _preferences = await SharedPreferences.getInstance();
    _lastRussianPage = _preferences.getInt(keyLastRussianPage) ?? 0;
    _trueRussianAnswerCount = _preferences.getInt(keyLastRussianPage) ?? 0;
    _russianPageController.jumpToPage(_trueRussianAnswerCount);
    if (_lastRussianPage == _russianQuestions.length) {
      Get.to(() => ScoreArabicPage(), preventDuplicates: false);
    }
  }

  checkAnswer(QuestionRussian question, int selectedIndex) {
    _isRussianAnswered = true;
    _selectedRussianAnswer = selectedIndex;
    _correctRussianAnswer = question.answer!;
    _preferences.setInt(keyLastRussianPage, _russianPageController.page!.round() + 1);
    saveAnswer();
    update();

    Future.delayed(
      Duration(
          milliseconds:
              _selectedRussianAnswer == _correctRussianAnswer ? 1500 : 3500),
      () {
        nextQuestion();
      },
    );
  }

  saveAnswer() {
    if (_selectedRussianAnswer == _correctRussianAnswer) {
      _trueRussianAnswerCount++;
      _preferences.setInt(keyTrueRussianAnswer, _trueRussianAnswerCount);
      _databaseQuery.changeRussianAnswerState(0, _questionRussianNumber.value);
    } else {
      _databaseQuery.changeRussianAnswerState(1, _questionRussianNumber.value);
    }
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
    _questionRussianNumber.value = 1;
    await _preferences.setInt(keyLastRussianPage, 0);
    await _preferences.setInt(keyTrueRussianAnswer, 0);
    _databaseQuery.resetArabicAnswerState();
    _russianPageController.jumpToPage(0);
    update();
  }
}