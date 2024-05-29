import 'package:flutter/material.dart';

class SettingsController with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void uchiribYoq(bool tungimi) {
    if (tungimi) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
