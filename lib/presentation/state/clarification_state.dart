import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';

class ClarificationState extends ChangeNotifier {

  ClarificationState() {
    _clarificationPage = _contentSettingsBox.get(AppConstraints.keyLastMainClarificationIndex, defaultValue: 0);
  }

  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);

  late final PageController _pageController = PageController(initialPage: _clarificationPage);

  PageController get pageController => _pageController;

  int _clarificationPage = 0;

  int get clarificationPage => _clarificationPage;

  set clarificationPage(int page) {
    _clarificationPage = page;
    _savePage();
    notifyListeners();
  }

  void toPage(int page) {
    _savePage();
    _pageController.animateToPage(page, duration: Duration(milliseconds: 350), curve: Curves.linear);
  }

  void _savePage() {
    _contentSettingsBox.put(AppConstraints.keyLastMainClarificationIndex, _clarificationPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}