import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode currentMode = ThemeMode.system;
  String selectedlanguageCode = "en";
  get appTheme => currentMode;
  get appLanguage => selectedlanguageCode;
  void changeAppTheme(ThemeMode mode) {
    if (currentMode == mode) return;
    currentMode = mode;
    notifyListeners();
  }

  void changeLanguage(String languageCode) {
    if (selectedlanguageCode == languageCode) return;
    selectedlanguageCode = languageCode;
    notifyListeners();
  }
}
