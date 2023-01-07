import 'package:flutter/material.dart';

import '../Database/LocalDatabase.dart';
import '../Models/Users/Users.dart';

class UserProvider extends ChangeNotifier {
  Users? _user=Users();
  Users? get user => _user;
  void setUser(Users? user) {
    _user = user;
    notifyListeners();
  }
}