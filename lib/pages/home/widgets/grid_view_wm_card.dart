import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/pages/explenation_pages/single_wm_page/single_wm_page.dart';
import 'package:acronyc_app/pages/home/widgets/wm_card_action_dialog.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utiles/colors.dart';
import '../../../utiles/constants.dart';
import '../../../utiles/helper_functions/get_difficulty_icon.dart';
import '../../../utiles/text_styles.dart';

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
        MaterialPageRoute(
            builder: (context) => SingleWmPage(
                  wm: wm,
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
                  Image.asset(
                    wm.steps[0].image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    // height: MediaQuery.of(context).size.width,
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
                            // Add box shadow if needed, remove if not
                            border: Border.all(
                              color: userInputProvider
                                      .isWashingMachineMarked(wm.id)
                                  ? ACCENT_COLOR
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Image(
                              image: wm.difficulty.icon,
                              height: DIFFICULTY_ICON_HEIGHT,
                              width: DIFFICULTY_ICON_WIDTH,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 3,
                    left: 3,
                    child: AchievedAsanasComponent(asanaIds: wm.asanaIds),
                  )
                ],
              ),
            ),
            Container(
              height: CARD_TEXT_HEIGHT,
              padding: const EdgeInsets.symmetric(horizontal: 2.0)
                  .copyWith(top: 2.0),
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
                      if (userInputProvider.isWashingMachineCompleted(wm.id))
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
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ForwardIconStateComponent(isActive: true),
        ForwardIconStateComponent(isActive: true),
        ForwardIconStateComponent(isActive: false),
        ForwardIconStateComponent(isActive: false),
        ForwardIconStateComponent(isActive: false),
      ],
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
