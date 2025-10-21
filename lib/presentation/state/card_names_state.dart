import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/strings/app_constraints.dart';

class CardNamesState extends ChangeNotifier {
  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);

  CardNamesState() {
    _pageMode = _contentSettingsBox.get(AppConstraints.keyCardNamesPageMode, defaultValue: false);
  }

  final ItemScrollController _itemScrollController = ItemScrollController();

  ItemScrollController get itemScrollController => _itemScrollController;

  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  int _namePage = 0;

  int get namePage => _namePage;

  set namePage(int value) {
    _namePage = value;
    notifyListeners();
  }

  final Random _randomValue = Random();

  bool _isFlipCard = true;

  bool get isFlipCard => _isFlipCard;

  void toListDefaultItem() {
    if (_itemScrollController.isAttached) {
      _itemScrollController.scrollTo(
        index: _randomValue.nextInt(99),
        duration: const Duration(
          milliseconds: 750,
        ),
      );
    }
  }

  void toPageDefaultItem() {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        _randomValue.nextInt(99),
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.slowMiddle,
      );
    }
  }

  void get changeFlipCard {
    _isFlipCard = !_isFlipCard;
    notifyListeners();
  }

  bool _pageMode = false;

  bool get pageMode => _pageMode;

  void get changePageMode {
    _pageMode = !_pageMode;
    _contentSettingsBox.put(AppConstraints.keyCardNamesPageMode, _pageMode);
    notifyListeners();
  }
}
