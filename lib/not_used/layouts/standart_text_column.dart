import 'package:flutter/material.dart';

import '../../utiles/text_styles.dart';

class StandartTextColumn extends StatelessWidget {
  const StandartTextColumn(
      {super.key, required this.children, required this.crossAxisAlignment});

  final List<String> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    List<Widget> spacedChildren = [];
    for (var child in children) {
      spacedChildren.add(Text(
        child,
        style: STANDART_DESCRIPTION,
        textAlign: crossAxisAlignment == CrossAxisAlignment.center
            ? TextAlign.center
            : TextAlign.left,
      ));
      spacedChildren.add(const SizedBox(
        height: 10,
      ));
    }
    spacedChildren.removeLast();
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: spacedChildren,
    );
  }
}
