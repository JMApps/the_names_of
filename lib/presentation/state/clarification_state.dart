import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/strings/app_constraints.dart';

class ClarificationState extends ChangeNotifier {

  ClarificationState() {
    _clarificationPage = _contentSettingsBox.get(AppConstraints.keyLastMainClarificationIndex, defaultValue: 0);
  }

  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);

  late final PageController _pageController = PageController(initialPage: _clarificationPage);

  final ItemScrollController _itemScrollController = ItemScrollController();
  ItemScrollController get itemScrollController => _itemScrollController;

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
    if (_pageController.hasClients) {
      _pageController.animateToPage(page, duration: Duration(milliseconds: 350), curve: Curves.linear);
    }
  }

  void _savePage() {
    _contentSettingsBox.put(AppConstraints.keyLastMainClarificationIndex, _clarificationPage);
  }

  void scrollToPage() {
    _itemScrollController.scrollTo(index: _clarificationPage, duration: Duration(milliseconds: 500), curve: Curves.easeInOutCubic, alignment: 0.35);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}