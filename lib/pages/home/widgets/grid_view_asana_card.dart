import 'package:acronyc_app/pages/home/widgets/asana_card_action_dialog.dart';
import 'package:flutter/material.dart';

import '../../../data/example_asanas.dart';
import '../../../models/asana_model.dart';
import '../../../utiles/colors.dart';
import '../../../utiles/constants.dart';
import '../../../utiles/helper_functions/get_difficulty_icon.dart';
import '../../../utiles/text_styles.dart';
import '../../single_asana_page/single_asana_page.dart';

class GridViewAsanaCard extends StatelessWidget {
  const GridViewAsanaCard({
    super.key,
    required this.asana,
  });

  final AsanaModel asana;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showPreview(context),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SingleAsanaPage(
                  asana: getAsanaFromId(asana.id),
                )),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: asana.isCompleted
                            ? ACCENT_COLOR
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      asana.img,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      // height: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: ClipOval(
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.7), // Subdued color
                          shape: BoxShape.circle, // Circular shape
                          // Add box shadow if needed, remove if not
                        ),
                        child: Image(
                          image: asana.difficulty.icon,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: CARD_TEXT_HEIGHT,
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
              child: Center(
                child: Text(
                  asana.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: CARD_SUBTITLE.copyWith(height: 1),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showPreview(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AsanaOptionDialog(
          asana: asana,
        );
      },
    );
  }
}
