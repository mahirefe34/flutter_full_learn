import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/navigator/navigator_custom.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPage(NavigateCustomEnum route, {Object? arguments}) async {
    await _navigatorGlobalKey.currentState?.pushNamed(
      route.withParaf,
      arguments: arguments,
    );
  }
}
