import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';

class ClarificationState extends ChangeNotifier {

  late final int _contentIndex;
  ClarificationState(this._contentIndex);

  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);

  late final PageController _pageController = PageController(initialPage: _clarificationPage);

  PageController get pageController => _pageController;

  late int _clarificationPage = 0;

  int get clarificationPage => _clarificationPage;

  set clarificationPage(int pageIndex) {
    _clarificationPage = pageIndex;
    _contentSettingsBox.put(AppConstraints.keyLastMainContentIndex, pageIndex);
    notifyListeners();
  }
}