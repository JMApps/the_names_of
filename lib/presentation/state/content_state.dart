import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ContentState extends ChangeNotifier {
  ContentState(this._contentPage);
  late final int _contentPage;
  late final PageController _pageController = PageController(initialPage: _contentPage);
  final ItemScrollController _itemScrollController = ItemScrollController();

  PageController get pageController => _pageController;
  ItemScrollController get itemScrollController => _itemScrollController;

  void toPage({required int contentPage}) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(contentPage, duration: Duration(milliseconds: 350), curve: Curves.easeInOutCubic);
    }
  }

  void scrollToPage({required int contentPage}) {
    _itemScrollController.scrollTo(index: contentPage, duration: Duration(milliseconds: 500), curve: Curves.easeInOutCubic, alignment: 0.35);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}