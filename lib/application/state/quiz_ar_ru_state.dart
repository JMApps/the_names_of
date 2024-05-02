import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_names_of/domain/usecases/quiz_use_case.dart';

import '../../data/repositories/quiz_data_repository.dart';
import '../../domain/entities/quiz_entity.dart';
import '../strings/app_constraints.dart';

class QuizArRuState extends ChangeNotifier {
  final _quizUseCase = QuizUseCase(QuizDataRepository());

  QuizUseCase get getQuizUseCase => _quizUseCase;

  final Box _contentSettingsBox = Hive.box(AppConstraints.keyQuizApp);

  late final PageController _pageController;

  Timer? _questionTimer;

  PageController get getPageController => _pageController;

  int _arRuModePageNumber = 1;

  int get getArRuModePageNumber => _arRuModePageNumber;

  int _selectedAnswerIndex = -1;

  int get selectedAnswerIndex => _selectedAnswerIndex;

  bool _isClickedAnswer = true;

  bool get isClickedAnswer => _isClickedAnswer;

  bool _isCorrectAnswer = false;

  bool get isCorrectAnswer => _isCorrectAnswer;

  QuizArRuState() {
    _arRuModePageNumber = _contentSettingsBox.get(AppConstraints.keyArRuPageNumber, defaultValue: 1);
    _pageController = PageController(initialPage: _arRuModePageNumber - 1);
  }

  Future<void> answer({required QuizEntity model, required int index}) async {
    if (_arRuModePageNumber < 99) {
      if (model.answerState == 0) {
        await _contentSettingsBox.put(AppConstraints.keyArRuPageNumber, model.id + 1);
        _isClickedAnswer = false;
        _isCorrectAnswer = model.correct == index;
        _selectedAnswerIndex = index;
        _quizUseCase.fetchArRuAnswer(answerId: model.id, answerState: model.correct == index ? 1 : 2);
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
    } else if (_arRuModePageNumber == 99) {
      if (model.answerState == 0) {
        await _contentSettingsBox.put(AppConstraints.keyArRuPageNumber, model.id + 1);
        _isClickedAnswer = false;
        _isCorrectAnswer = model.correct == index;
        _selectedAnswerIndex = index;
        _quizUseCase.fetchArRuAnswer(answerId: model.id, answerState: model.correct == index ? 1 : 2);
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
    _arRuModePageNumber = page + 1;
    notifyListeners();
    return _arRuModePageNumber;
  }

  Future<void> resetQuiz() async {
    await _quizUseCase.fetchArRuResetAnswer();
    await _contentSettingsBox.put(AppConstraints.keyArRuPageNumber, 1);
    await _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeOutSine,
    );
    _isClickedAnswer = true;
    _isCorrectAnswer = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _questionTimer?.cancel();
    super.dispose();
  }
}
