import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';

class ContentClarificationState extends ChangeNotifier {
  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);

  ContentClarificationState() {
    _contentPage = _contentSettingsBox.get(AppConstraints.keyLastMainContentIndex, defaultValue: 0);
    _clarificationPage = _contentSettingsBox.get(AppConstraints.keyLastMainClarificationIndex, defaultValue: 0);
  }

  int _contentPage = 0;

  int get contentPage => _contentPage;

  set contentPage(int page) {
    _contentPage = page;
    _saveContentPage();
    notifyListeners();
  }

  int _clarificationPage = 0;

  int get clarificationPage => _clarificationPage;

  set clarificationPage(int page) {
    _clarificationPage = page;
    _saveClarificationPage();
    notifyListeners();
  }

  void _saveContentPage() {
    _contentSettingsBox.put(AppConstraints.keyLastMainContentIndex, _contentPage);
  }

  void _saveClarificationPage() {
    _contentSettingsBox.put(AppConstraints.keyLastMainClarificationIndex, _clarificationPage);
  }
}
