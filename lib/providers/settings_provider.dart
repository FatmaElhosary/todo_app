import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode currentMode = ThemeMode.system;
  get appTheme => currentMode;
  void changeAppTheme(ThemeMode mode) {
    currentMode = mode;
    notifyListeners();
  }
}
