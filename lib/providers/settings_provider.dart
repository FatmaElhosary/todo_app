import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // Obtain shared preferences.
  ThemeMode currentMode = ThemeMode.system;
  String selectedlanguageCode = "en";
  get appTheme => currentMode;
  String get appLanguage => selectedlanguageCode;
  void changeAppTheme(ThemeMode mode) {
    if (currentMode == mode) return;
    currentMode = mode;
    setSettingToPref();
    notifyListeners();
  }

  void changeLanguage(String languageCode) {
    if (selectedlanguageCode == languageCode) return;
    selectedlanguageCode = languageCode;
    setSettingToPref();
    notifyListeners();
  }

//////////////////get SharedPreferences data////////////////
  void initalizeSettings() async {
    final SharedPreferences prefs = await _prefs;
    currentMode = prefs.getString('theme') == 'light'
        ? ThemeMode.light
        : prefs.getString('theme') == 'dark'
            ? ThemeMode.dark
            : ThemeMode.system;
    selectedlanguageCode = prefs.getString('language') ?? 'en';
    notifyListeners();
  }

///////set SharedPreferences data///////////
  void setSettingToPref() async {
    final SharedPreferences prefs = await _prefs;
    String theme = appTheme == ThemeMode.light
        ? 'light'
        : appTheme == ThemeMode.dark
            ? 'dark'
            : 'system';
    prefs.setString('theme', theme);
    prefs.setString('language', appLanguage);
  }
}
