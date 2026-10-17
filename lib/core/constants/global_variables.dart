import 'package:flutter/material.dart';

class GlobalVariables {
  // static UserEntity? _user;

  static GlobalKey<NavigatorState>? _navigatorKey;

  // static UserEntity? get user => _user;

  static GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  // static UserContextEntity? _userContextEntity;

  // static UserContextEntity? get userContextEntity => _userContextEntity;

  static int maxTestImages = 31;

  static ValueNotifier<bool> authenticated = ValueNotifier<bool>(false);

  // static void setUser(UserEntity? user) {
  //   _user = user;
  // }

  static void setNavigatorKey(GlobalKey<NavigatorState>? navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  // static void setUser(UserContextEntity user) {
  //   _userContextEntity = user;
  // }
}
