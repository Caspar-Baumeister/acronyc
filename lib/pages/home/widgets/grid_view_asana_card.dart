import 'package:acronyc_app/pages/home/widgets/asana_card_action_dialog.dart';
import 'package:acronyc_app/routing/routes/page_routes.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/asana_model.dart';
import '../../../utiles/colors.dart';
import '../../../utiles/constants.dart';
import '../../../utiles/text_styles.dart';

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
      onTap: () => Navigator.push(context, SingleAsanaPageRoute(asana)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Consumer<UserInputProvider>(
                    builder: (context, userInputProvider, _) =>
                        CustomCachedNetworkImage(
                      imageUrl: asana.steps.last.image,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Center(
                child: Consumer<UserInputProvider>(
                  builder: (context, userInputProvider, _) => RichText(
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: asana.name.toUpperCase(),
                          style: CARD_SUBTITLE.copyWith(height: 1),
                        ),
                        if (userInputProvider.isAsanaCompleted(asana.name))
                          const WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: Icon(
                                Icons.check_circle,
                                color: ACCENT_COLOR,
                                size: AppDimensions.iconSizeSmall,
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
