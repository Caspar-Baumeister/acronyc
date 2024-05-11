import 'package:flutter/material.dart';

import '../../../../models/asana_model.dart';
import '../../../../utiles/constants.dart';
import '../../../../utiles/text_styles.dart';
import '../../../home/widgets/grid_view_transition_card.dart';

class TransitionView extends StatelessWidget {
  const TransitionView({super.key, required this.asana});

  final AsanaModel asana;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: STANDART_HORIZONTAL_PADDING),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transitions vom ${asana.name.toUpperCase()}",
            style: SUB_TITLE,
            maxLines: 2,
          ),
          const SizedBox(height: 12),
          GridView.count(
              padding: const EdgeInsets.only(top: 0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: asana.transitions.map(
                (transition) {
                  return GridViewTransitionCard(
                    transition: transition,
                  );
                },
              ).toList()),
        ],
      ),
    );
  }
}
