import 'package:flutter/material.dart';

import '../../../data/example_washing_machines.dart';
import '../../../utiles/enums.dart';
import '../../../utiles/helper_functions/get_difficulty_icon.dart';
import '../../../utiles/text_styles.dart';
import '../../single_wm_page/single_wm_page.dart';

class GridViewWMCard extends StatelessWidget {
  const GridViewWMCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.wmId,
      required this.difficulty});

  final String title;
  final String imageUrl;
  final Difficulty difficulty;
  final String wmId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SingleWmPage(
                  wm: getWashingMachineFromId(wmId),
                )),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      title.toUpperCase(),
                      style: H14W5,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image(
                    image: difficulty.icon,
                    height: 30,
                    width: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
