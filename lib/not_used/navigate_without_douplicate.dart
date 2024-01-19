// ignore_for_file: avoid_print

import 'package:acronyc_app/not_used/navigation/custom_navigator_observer.dart';
import 'package:flutter/material.dart';

Future<void> pushWithoutDuplicate(
    BuildContext context, Route<dynamic> newRoute) async {
  // Get the current active route
  if (customNavigatorObserver.routeStack.isEmpty) {
    Navigator.of(context).push(newRoute);
    return;
  }
  final currentRoute = customNavigatorObserver.routeStack.last;

  // if the current route is the same as the newRoute, don't push
  if (currentRoute.settings.name == newRoute.settings.name) {
    return;
  } else {
    Route<dynamic>? duplicateRoute;
    for (var route in customNavigatorObserver.routeStack) {
      if (route.settings.name == newRoute.settings.name) {
        duplicateRoute = route;
        break;
      }
    }

    // Check if the duplicate route is in the route stack and pops until and after that route
    if (duplicateRoute != null) {
      Navigator.of(context).popUntil((route) => route == duplicateRoute);
      Navigator.of(context).pop();
    }

    await Navigator.of(context).push(newRoute);
  }
}
