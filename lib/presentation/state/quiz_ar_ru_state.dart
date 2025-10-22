import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';
import '../../domain/entities/quiz_entity.dart';
import '../../domain/usecases/quiz_use_case.dart';

class QuizArRuState extends ChangeNotifier {
  final Box _contentSettingsBox = Hive.box(AppConstraints.keyQuizApp);

  final QuizUseCase _quizUseCase;
  QuizArRuState(this._quizUseCase) {
    _arRuModePageNumber = _contentSettingsBox.get(AppConstraints.keyArRuPageNumber, defaultValue: 1);
    _pageController = PageController(initialPage: _arRuModePageNumber - 1);
  }

  late final PageController _pageController;

  PageController get pageController => _pageController;

  Timer? _questionTimer;

  int _arRuModePageNumber = 1;

  int get arRuModePageNumber => _arRuModePageNumber;

  int _selectedAnswerIndex = -1;

  int get selectedAnswerIndex => _selectedAnswerIndex;

  bool _isClickedAnswer = true;

  bool get isClickedAnswer => _isClickedAnswer;

  bool _isCorrectAnswer = false;

  bool get isCorrectAnswer => _isCorrectAnswer;

  Future<List<QuizEntity>> fetchAllArRuQuiz() async => _quizUseCase.fetchArabicQuiz();

  Future<List<Map<String, dynamic>>> fetchArRuTrueAnswers() async {
    return await _quizUseCase.fetchArRuTrueAnswers();
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
          Duration(milliseconds: model.correct == index ? 1500 : 3000),
          () {
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
          Duration(milliseconds: model.correct == index ? 1500 : 3000),
          () {
            _isClickedAnswer = true;
            _isCorrectAnswer = false;
            notifyListeners();
          },
        );
      }
    }
  }

  void changePageIndex(int page) {
    _arRuModePageNumber = page + 1;
    notifyListeners();
  }

  Future<void> resetQuiz() async {
    await _quizUseCase.fetchArRuResetAnswer();
    await _contentSettingsBox.put(AppConstraints.keyArRuPageNumber, 1);
    await _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOutBack,
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
