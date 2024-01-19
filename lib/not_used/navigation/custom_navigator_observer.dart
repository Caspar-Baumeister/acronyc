import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> routeStack = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.add(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.remove(route);
    super.didPop(route, previousRoute);
  }
}

final customNavigatorObserver = CustomNavigatorObserver();
