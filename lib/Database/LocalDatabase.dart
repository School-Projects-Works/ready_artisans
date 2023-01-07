import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ready_artisans/Models/Users/Users.dart';

class HiveApi{
  static final HiveApi _instance = HiveApi._internal();
  factory HiveApi() => _instance;
  HiveApi._internal();

  // Path: lib\Database\LocalDatabase.dart
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UsersAdapter());
    await Hive.openBox<Users>('users');
  }

  // Path: lib\Database\LocalDatabase.dart
   setUser(Users users)  {
    final box = Hive.box<Users>('users');
    box.put('user', users);
  }

  // Path: lib\Database\LocalDatabase.dart
   Users? getUser()  {
    final box = Hive.box<Users>('users');
    return box.get('user',defaultValue: Users());
  }


}