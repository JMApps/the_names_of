import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';
import '../../domain/entities/quiz_entity.dart';
import '../../domain/usecases/quiz_use_case.dart';

class QuizRuArState extends ChangeNotifier {
  final Box _contentSettingsBox = Hive.box(AppConstraints.keyQuizApp);

  final QuizUseCase _quizUseCase;

  QuizRuArState(this._quizUseCase) {
    _ruArModePageNumber = _contentSettingsBox.get(AppConstraints.keyRuArPageNumber, defaultValue: 1);
    _pageController = PageController(initialPage: _ruArModePageNumber - 1);
  }

  late final PageController _pageController;

  PageController get pageController => _pageController;

  Timer? _questionTimer;

  int _ruArModePageNumber = 1;

  int get ruArModePageNumber => _ruArModePageNumber;

  int _selectedAnswerIndex = -1;

  int get selectedAnswerIndex => _selectedAnswerIndex;

  bool _isClickedAnswer = true;

  bool get isClickedAnswer => _isClickedAnswer;

  bool _isCorrectAnswer = false;

  bool _toScorePage = false;

  bool get toScorePage => _toScorePage;

  Future<List<QuizEntity>> fetchAllRuArQuiz() async => _quizUseCase.fetchRussianQuiz();

  Future<List<Map<String, dynamic>>> fetchRuArTrueAnswers() async {
    return await _quizUseCase.fetchRuArTrueAnswers();
  }

  Future<void> answer({required QuizEntity model, required int index}) async {
    if (_ruArModePageNumber <= 99) {
      if (model.answerState == 0) {
        await _contentSettingsBox.put(AppConstraints.keyRuArPageNumber, model.id + 1);
        _isClickedAnswer = false;
        _isCorrectAnswer = model.correct == index;
        _isCorrectAnswer ? HapticFeedback.lightImpact() : HapticFeedback.vibrate();
        _selectedAnswerIndex = index;

        await _quizUseCase.fetchRuArAnswer(
          answerId: model.id,
          answerState: model.correct == index ? 1 : 2,
        );

        notifyListeners();

        _questionTimer = Timer(
          Duration(milliseconds: model.correct == index ? 1500 : 3000), () {
            _isClickedAnswer = true;
            _isCorrectAnswer = false;

            if (_pageController.hasClients && _ruArModePageNumber < 99) {
              _pageController.animateToPage(
                _ruArModePageNumber,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn,
              );
            }

            notifyListeners();
          },
        );
      } else {
        if (_ruArModePageNumber == 99) {
          _toScorePage = true;
          notifyListeners();
        }
      }
    }
  }

  void changePageIndex(int page) async {
    _ruArModePageNumber = page + 1;
    notifyListeners();
  }

  Future<void> resetQuiz() async {
    HapticFeedback.lightImpact();
    await _quizUseCase.fetchRuArResetAnswer();
    await _contentSettingsBox.put(AppConstraints.keyRuArPageNumber, 1);
    await _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOutBack,
    );

    _toScorePage = false;
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
