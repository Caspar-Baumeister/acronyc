import 'package:flutter/material.dart';

class MainBodyPadding extends StatelessWidget {
  const MainBodyPadding({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: child,
    );
  }
}
