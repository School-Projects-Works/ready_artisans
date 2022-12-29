import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ready_artisans/Providers/LocationProvider.dart';

class NavigationProvider extends ChangeNotifier {
  int _welcomeIndex = 0;
  int get welcomeIndex => _welcomeIndex;

  void setWelcomeIndex(int index) {
    _welcomeIndex = index;
    notifyListeners();
  }


 final _controller = PersistentTabController(initialIndex: 0);
  PersistentTabController get controller => _controller;
  void setController(int index) {
    _controller.index = index;
    notifyListeners();
  }
}
