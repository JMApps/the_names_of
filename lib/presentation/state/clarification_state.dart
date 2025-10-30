import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ClarificationState extends ChangeNotifier {

  ClarificationState(this._clarificationPage);
  late final int _clarificationPage;
  late final PageController _pageController = PageController(initialPage: _clarificationPage);
  final ItemScrollController _itemScrollController = ItemScrollController();

  ItemScrollController get itemScrollController => _itemScrollController;

  PageController get pageController => _pageController;

  void toPage({required int clarificationPage}) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(clarificationPage, duration: Duration(milliseconds: 350), curve: Curves.linear);
    }
  }

  void scrollToPage({required int clarificationPage}) {
    _itemScrollController.scrollTo(index: clarificationPage, duration: Duration(milliseconds: 500), curve: Curves.easeInOutCubic, alignment: 0.35);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
