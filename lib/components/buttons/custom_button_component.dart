import 'package:acronyc_app/pages/home/widgets/filter_row_item_container.dart';
import 'package:flutter/material.dart';

class CustomButtonComponent extends StatelessWidget {
  const CustomButtonComponent(
      {super.key,
      required this.onTap,
      required this.text,
      required this.width});

  final Function() onTap;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: FilterRowItemContainer(
          isActive: false,
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
