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
    setThemeToPref();
    notifyListeners();
  }

  void changeLanguage(String languageCode) {
    if (selectedlanguageCode == languageCode) return;
    selectedlanguageCode = languageCode;
    setThemeToPref();
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
  void setThemeToPref() async {
    final SharedPreferences prefs = await _prefs;
    String theme = appTheme == ThemeMode.light
        ? 'light'
        : appTheme == ThemeMode.dark
            ? 'dark'
            : 'system';
    prefs.setString('theme', theme);
  }

  void setLanguageToPref() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('language', appLanguage);
  }
}
