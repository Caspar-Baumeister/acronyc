import 'package:acronyc_app/routing/routes/transitions.dart';
import 'package:flutter/material.dart';

class BaseRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
      transitionsBuilderFunction;

  BaseRoute(this.page,
      //this.name,
      { //this.path,

      this.transitionsBuilderFunction = Transitions.pageFlipWithFade})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder: transitionsBuilderFunction);
}
