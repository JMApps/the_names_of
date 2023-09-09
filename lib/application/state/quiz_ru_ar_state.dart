import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_names_of/application/strings/app_constraints.dart';
import 'package:the_names_of/data/local/database_quiz_query.dart';
import 'package:the_names_of/domain/models/quiz_model.dart';

class QuizRuArState extends ChangeNotifier {
  final DatabaseQuizQuery _databaseQuizQuery = DatabaseQuizQuery();

  DatabaseQuizQuery get databaseQuizQuery => _databaseQuizQuery;

  final Box _contentSettingsBox = Hive.box(AppConstraints.keyQuizApp);

  late final PageController _pageController;

  Timer? _questionTimer;

  PageController get getPageController => _pageController;

  int _ruArModePageNumber = 1;

  int get getRuArModePageNumber => _ruArModePageNumber;

  int _selectedAnswerIndex = -1;

  int get selectedAnswerIndex => _selectedAnswerIndex;

  bool _isClickedAnswer = true;

  bool get isClickedAnswer => _isClickedAnswer;

  bool _isCorrectAnswer = false;

  bool get isCorrectAnswer => _isCorrectAnswer;

  QuizRuArState() {
    _ruArModePageNumber = _contentSettingsBox.get(AppConstraints.keyRuArPageNumber, defaultValue: 1);
    _pageController = PageController(initialPage: _ruArModePageNumber - 1);
  }

  Future<void> answer({required QuizModel model, required int index}) async {
    if (_ruArModePageNumber < 99) {
      if (model.answerState == 0) {
        await _contentSettingsBox.put(AppConstraints.keyRuArPageNumber, model.id + 1);
        _isClickedAnswer = false;
        _isCorrectAnswer = model.correct == index;
        _selectedAnswerIndex = index;
        _databaseQuizQuery.setRuArAnswer(answerId: model.id, answerState: model.correct == index ? 1 : 2);
        notifyListeners();
        _questionTimer = Timer(
          Duration(milliseconds: model.correct == index ? 1500 : 3000), () {
            _isClickedAnswer = true;
            _isCorrectAnswer = false;
            if (_pageController.hasClients) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn,
              );
            }
            notifyListeners();
          },
        );
      }
    } else if (_ruArModePageNumber == 99) {
      if (model.answerState == 0) {
        await _contentSettingsBox.put(AppConstraints.keyRuArPageNumber, model.id + 1);
        _isClickedAnswer = false;
        _isCorrectAnswer = model.correct == index;
        _selectedAnswerIndex = index;
        _databaseQuizQuery.setRuArAnswer(answerId: model.id, answerState: model.correct == index ? 1 : 2);
        notifyListeners();
        _questionTimer = Timer(
          Duration(milliseconds: model.correct == index ? 1500 : 3000), () {
            _isClickedAnswer = true;
            _isCorrectAnswer = false;
            notifyListeners();
          },
        );
      }
    }
  }

  Future<int> changePageIndex(int page) async {
    _ruArModePageNumber = page + 1;
    notifyListeners();
    return _ruArModePageNumber;
  }

  Future<void> resetQuiz() async {
    _databaseQuizQuery.resetRuArAnswer();
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _questionTimer?.cancel();
    super.dispose();
  }
}
