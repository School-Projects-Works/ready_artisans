import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _welcomeIndex = 0;
  int get welcomeIndex => _welcomeIndex;

  void setWelcomeIndex(int index) {
    _welcomeIndex = index;
    notifyListeners();
  }
}
