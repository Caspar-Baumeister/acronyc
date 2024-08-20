import 'package:acronyc_app/components/custom_cached_network_image.dart';
import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/pages/home/widgets/action_dialog_popups/wm_card_action_dialog.dart';
import 'package:acronyc_app/pages/home/widgets/card_difficulty_widget.dart';
import 'package:acronyc_app/routing/routes/page_routes.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utiles/colors.dart';
import '../../../../utiles/constants.dart';
import '../../../../utiles/text_styles.dart';

class GridViewWmCard extends StatelessWidget {
  const GridViewWmCard({
    super.key,
    required this.wm,
  });

  final WashingMachinesModel wm;

  @override
  Widget build(BuildContext context) {
    UserInputProvider userInputProvider =
        Provider.of<UserInputProvider>(context);

    return GestureDetector(
      onLongPress: () => _showPreview(context),
      onTap: () => Navigator.push(
        context,
        SingleWmPageRoute(wm),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Stack(
              children: [
                CustomImageWrapper(
                  imageUrl: wm.steps.last.image,
                  poseIdentifier: wm.name,

                  // height: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: 3,
                  right: 3,
                  child: ClipOval(
                    child: GestureDetector(
                      onTap: () => _showPreview(context),
                      child: CardDifficultyWidget(
                        icon: wm.difficulty.icon,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 13,
                  left: 5,
                  child: AchievedAsanasComponent(asanaIds: wm.asanas),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Center(
              // richtext with check icon and text
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: wm.name.toUpperCase(),
                      style: CARD_SUBTITLE.copyWith(height: 1),
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    if (userInputProvider.isWashingMachineCompleted(wm.name))
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
        return WmOptionDialog(
          wm: wm,
        );
      },
    );
  }
}

class AchievedAsanasComponent extends StatelessWidget {
  const AchievedAsanasComponent({super.key, required this.asanaIds});

  final List<String> asanaIds;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: asanaIds
          .map((asanaId) => ForwardIconStateComponent(
                isActive: Provider.of<UserInputProvider>(context, listen: false)
                    .isAsanaCompleted(asanaId),
              ))
          .toList(),
    );
  }
}

class ForwardIconStateComponent extends StatelessWidget {
  const ForwardIconStateComponent({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        color: isActive ? ACCENT_COLOR : Colors.grey,
        size: STANDART_ICON_SIZE,
      ),
    );
  }
}
