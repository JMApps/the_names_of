import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';

class ContentState extends ChangeNotifier {

  ContentState() {
    _contentPage = _contentSettingsBox.get(AppConstraints.keyLastMainContentIndex, defaultValue: 0);
  }

  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);

  late final PageController _pageController = PageController(initialPage: _contentPage);

  PageController get pageController => _pageController;

  int _contentPage = 0;

  int get contentPage => _contentPage;

  set contentPage(int page) {
    _contentPage = page;
    _savePage();
    notifyListeners();
  }

  void toPage(int page) {
    _savePage();
    _pageController.animateToPage(page, duration: Duration(milliseconds: 350), curve: Curves.linear);
  }

  void _savePage() {
    _contentSettingsBox.put(AppConstraints.keyLastMainContentIndex, _contentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}