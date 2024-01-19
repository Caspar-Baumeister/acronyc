import 'package:flutter/material.dart';

import '../../../models/transition_model.dart';
import '../../../utiles/helper_functions/get_difficulty_icon.dart';
import '../../../utiles/text_styles.dart';
import '../../single_transition_page/single_transition_page.dart';

class GridViewTransitionCard extends StatelessWidget {
  const GridViewTransitionCard({
    super.key,
    required this.transition,
  });

  final TransitionModel transition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SingleTransitionPage(
                  transition: transition,
                )),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset(
                transition.endAsana.img,
                fit: BoxFit.cover,
                // height: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      transition.endAsana.name.toUpperCase(),
                      style: H14W5,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image(
                    image: transition.difficulty.icon,
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
