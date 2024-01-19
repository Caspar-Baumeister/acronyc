import 'package:flutter/material.dart';

class NoTransitionPageRoute extends PageRouteBuilder {
  final Widget Function(BuildContext) builder;

  NoTransitionPageRoute({required this.builder, RouteSettings? settings})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return builder(context);
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return child;
          },
          settings: settings, // Add this line to accept RouteSettings
        );
}
