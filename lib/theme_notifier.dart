import 'package:flutter/material.dart';
import 'package:foodapp_new/spref.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeNotifier() {
    loadTheme();
  }

  void loadTheme() async {
    _isDarkTheme = SharedPref.pref?.getBool('tema') ?? false;
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkTheme = !_isDarkTheme;
    SharedPref.pref?.setBool('tema', _isDarkTheme);
    notifyListeners();
  }
}
