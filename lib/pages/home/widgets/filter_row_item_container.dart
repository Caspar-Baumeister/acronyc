import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';

class FilterRowItemContainer extends StatelessWidget {
  const FilterRowItemContainer(
      {super.key, required this.child, required this.isActive});

  final Widget child;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: const BoxConstraints(maxHeight: FILTER_HEIGHT),
      height: FILTER_HEIGHT,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(STANDART_BUTTON_ROUNDNESS),
        color: isActive ? ACCENT_COLOR : COMPONENT_BACKGROUND_COLOR,
        border: Border.all(color: TEXT_COLOR),
      ),
      child: child,
    );
  }
}
