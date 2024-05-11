import 'package:acronyc_app/pages/home/widgets/asana_card_action_dialog.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/asana_model.dart';
import '../../../utiles/colors.dart';
import '../../../utiles/constants.dart';
import '../../../utiles/helper_functions/get_difficulty_icon.dart';
import '../../../utiles/text_styles.dart';
import '../../explenation_pages/single_asana_page/single_asana_page.dart';

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
                  asana: asana,
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
                  Consumer<UserInputProvider>(
                    builder: (context, userInputProvider, _) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: userInputProvider.isAsanaMarked(asana.id)
                              ? ACCENT_COLOR
                              : Colors.transparent,
                          width: 4,
                        ),
                      ),
                      child: Image.asset(
                        asana.image,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        // height: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 3,
                    right: 3,
                    child: ClipOval(
                      child: GestureDetector(
                        onTap: () => _showPreview(context),
                        child: Container(
                          padding: const EdgeInsets.only(right: 1.0, top: 1),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.7), // Subdued color
                            shape: BoxShape.circle, // Circular shape
                          ),
                          child: Center(
                            child: Image(
                              image: asana.difficulty.icon,
                              height: DIFFICULTY_ICON_HEIGHT,
                              width: DIFFICULTY_ICON_WIDTH,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: CARD_TEXT_HEIGHT,
              padding: const EdgeInsets.symmetric(horizontal: 2.0)
                  .copyWith(top: 2.0),
              child: Center(
                child: Consumer<UserInputProvider>(
                  builder: (context, userInputProvider, _) => RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: asana.name.toUpperCase(),
                          style: CARD_SUBTITLE.copyWith(height: 1),
                        ),
                        if (userInputProvider.isAsanaCompleted(asana.id))
                          const WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: Icon(
                                Icons.check_circle,
                                color: ACCENT_COLOR,
                                size: STANDART_ICON_SIZE,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
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
