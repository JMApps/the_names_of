import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/strings/app_constraints.dart';

class ContentState extends ChangeNotifier {

  ContentState() {
    _contentPage = _contentSettingsBox.get(AppConstraints.keyLastMainContentIndex, defaultValue: 0);
  }


  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);

  late final PageController _pageController = PageController(initialPage: _contentPage);
  final ItemScrollController _itemScrollController = ItemScrollController();

  PageController get pageController => _pageController;
  ItemScrollController get itemScrollController => _itemScrollController;

  int _contentPage = 0;

  int get contentPage => _contentPage;

  set contentPage(int page) {
    _contentPage = page;
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
    _contentSettingsBox.put(AppConstraints.keyLastMainContentIndex, _contentPage);
  }

  void scrollToPage() {
    _itemScrollController.scrollTo(index: _contentPage, duration: Duration(milliseconds: 500), curve: Curves.easeInOutCubic, alignment: 0.35);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}