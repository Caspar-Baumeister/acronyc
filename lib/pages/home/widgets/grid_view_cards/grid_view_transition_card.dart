import 'package:acronyc_app/pages/home/widgets/action_dialog_popups/transition_card_action_dialog.dart';
import 'package:acronyc_app/pages/home/widgets/card_difficulty_widget.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:acronyc_app/utiles/custom_cached_network_image.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/transition_model.dart';
import '../../../../utiles/text_styles.dart';
import '../../../single_skill_screens/single_transition_page/single_transition_page.dart';

class GridViewTransitionCard extends StatelessWidget {
  const GridViewTransitionCard({
    super.key,
    required this.transition,
  });

  final TransitionModel transition;

  @override
  Widget build(BuildContext context) {
    UserInputProvider userInputProvider =
        Provider.of<UserInputProvider>(context);
    return GestureDetector(
      onLongPress: () => _showPreview(context),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SingleTransitionPage(
                  transition: transition,
                )),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Stack(
              children: [
                CustomImageWrapper(
                  poseIdentifier: transition.id,
                  imageUrl: transition.steps.first.image,

                  // height: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: 3,
                  right: 3,
                  child: ClipOval(
                    child: GestureDetector(
                      onTap: () {}, // => _showPreview(context),
                      child: CardDifficultyWidget(
                        icon: transition.difficulty.icon,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 2.0).copyWith(top: 2.0),
            child: Center(
              // richtext with check icon and text
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${transition.startAsanaName} > ${transition.endAsanaName}',
                      style: CARD_SUBTITLE.copyWith(height: 1),
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    if (userInputProvider.isTransitionCompleted(transition.id))
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
          )
        ],
      ),
    );
  }

  void _showPreview(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TransitionCardActionDialog(
          transition: transition,
        );
      },
    );
  }
}
