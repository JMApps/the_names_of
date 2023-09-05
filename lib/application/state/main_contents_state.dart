import 'package:flutter/material.dart';

class MainContentsState extends ChangeNotifier {
  final int contentId;
  late final PageController _pageController;

  MainContentsState([this.contentId = 0]) {
    debugPrint('init = $contentId');
    _pageController = PageController(initialPage: contentId);
  }

  PageController get getPageController => _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
