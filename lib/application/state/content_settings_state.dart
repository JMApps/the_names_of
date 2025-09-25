import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../strings/app_constraints.dart';

class ContentSettingsState extends ChangeNotifier {
  final Box _contentSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);

  int _fontIndex = 0;

  int get fontIndex => _fontIndex;

  set fontIndex(int index) {
    if (_fontIndex != index) {
      _fontIndex = index;
      _contentSettingsBox.put(AppConstraints.keyFontIndex, index);
      notifyListeners();
    }
  }

  int _textAlignIndex = 0;

  int get textAlignIndex => _textAlignIndex;

  set textAlignIndex(int index) {
    if (_textAlignIndex != index) {
      _textAlignIndex = index;
      _contentSettingsBox.put(AppConstraints.keyTextAlign, index);
      notifyListeners();
    }
  }

  double _textSize = 20.0;

  double get textSize => _textSize;

  set textSize(double size) {
    if (_textSize != size) {
      _textSize = size;
      _contentSettingsBox.put(AppConstraints.keyTextSize, size);
      notifyListeners();
    }
  }

  Color _lightTextColor = Colors.grey.shade900;

  Color get lightTextColor => _lightTextColor;

  set lightTextColor(Color color) {
    if ( _lightTextColor != color) {
      _lightTextColor = color;
      _contentSettingsBox.put(AppConstraints.keyLightTextColor, color.toARGB32());
      notifyListeners();
    }
  }

  Color _darkTextColor = Colors.grey.shade50;

  Color get darkTextColor => _darkTextColor;

  set darkTextColor(Color color) {
    if (_darkTextColor != color) {
      _darkTextColor = color;
      _contentSettingsBox.put(AppConstraints.keyDarkTextColor, color.toARGB32());
      notifyListeners();
    }
  }

  int _appThemeModeIndex = 2;

  int get appThemeModeIndex => _appThemeModeIndex;

  set appThemeModeIndex(int index) {
    if (_appThemeModeIndex != index) {
      _appThemeModeIndex = index;
      _contentSettingsBox.put(AppConstraints.keyAppThemeModeIndex, index);
      notifyListeners();
    }
  }

  ThemeMode get appThemeMode {
    switch (_appThemeModeIndex) {
      case 0: return ThemeMode.light;
      case 1: return ThemeMode.dark;
      case 2: return ThemeMode.system;
      default: return ThemeMode.system;
    }
  }

  bool _wakeLock = true;

  bool get wakeLock => _wakeLock;

  set wakeLock(bool onChanged) {
    _wakeLock = onChanged;
    _wakeLock ? WakelockPlus.enable() : WakelockPlus.disable();
    _contentSettingsBox.put(AppConstraints.keyWakeLock, onChanged);
    notifyListeners();
  }

  ContentSettingsState() {
    _fontIndex = _contentSettingsBox.get(AppConstraints.keyFontIndex, defaultValue: 0);
    _textAlignIndex = _contentSettingsBox.get(AppConstraints.keyTextAlign, defaultValue: 0);
    _textSize = _contentSettingsBox.get(AppConstraints.keyTextSize, defaultValue: 18.0);
    _lightTextColor = Color(_contentSettingsBox.get(AppConstraints.keyLightTextColor, defaultValue: Colors.grey.shade900.toARGB32()));
    _darkTextColor = Color(_contentSettingsBox.get(AppConstraints.keyDarkTextColor, defaultValue: Colors.grey.shade50.toARGB32()));
    _appThemeModeIndex = _contentSettingsBox.get(AppConstraints.keyAppThemeModeIndex, defaultValue: 2);
    _wakeLock = _contentSettingsBox.get(AppConstraints.keyWakeLock, defaultValue: true);
    _wakeLock ? WakelockPlus.enable() : WakelockPlus.disable();
  }
}
