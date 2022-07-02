import 'package:flutter/material.dart';

class ChangesTheme extends ChangeNotifier {
  static ChangesTheme instance = ChangesTheme();
  bool isDarkTheme = false;
  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}

