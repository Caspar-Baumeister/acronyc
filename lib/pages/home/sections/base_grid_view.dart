import 'package:acronyc_app/components/buttons/reset_filter_button.dart';
import 'package:flutter/material.dart';

class BaseGridViewSection extends StatelessWidget {
  const BaseGridViewSection({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return children.isEmpty
        ? const Center(
            child: ResetFilterButton(),
          )
        : GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.75,
            children: children);
  }
}
