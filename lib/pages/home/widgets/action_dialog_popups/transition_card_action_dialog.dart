import 'package:acronyc_app/components/custom_cached_network_image.dart';
import 'package:acronyc_app/models/transition_model.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utiles/colors.dart';

class TransitionCardActionDialog extends StatefulWidget {
  const TransitionCardActionDialog({super.key, required this.transition});

  final TransitionModel transition;

  @override
  State<TransitionCardActionDialog> createState() =>
      _TransitionCardActionDialogState();
}

class _TransitionCardActionDialogState
    extends State<TransitionCardActionDialog> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    UserInputProvider userInputProvider =
        Provider.of<UserInputProvider>(context);
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(
                    15.0)), // Round corners for the top of the image
            child: CustomImageWrapper(
              poseIdentifier: widget.transition.id,
              imageUrl: widget.transition.steps.last.image,
              height: MediaQuery.of(context).size.width * 0.9,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon:
                      userInputProvider.isTransitionMarked(widget.transition.id)
                          ? const Icon(
                              Icons.star,
                              color: ACCENT_COLOR,
                              size: STANDART_ICON_SIZE_BIG,
                            )
                          : const Icon(
                              Icons.star_border,
                              color: TEXT_COLOR,
                              size: STANDART_ICON_SIZE_BIG,
                            ),
                  onPressed: () {
                    userInputProvider
                        .toggleMarkedTransition(widget.transition.id);
                  },
                ),
                IconButton(
                  icon: userInputProvider
                          .isTransitionCompleted(widget.transition.id)
                      ? const Icon(
                          Icons.check_circle,
                          color: ACCENT_COLOR,
                          size: STANDART_ICON_SIZE_BIG,
                        )
                      : const Icon(
                          Icons.check_circle_outline,
                          color: TEXT_COLOR,
                          size: STANDART_ICON_SIZE_BIG,
                        ),
                  onPressed: () {
                    userInputProvider
                        .toggleCompletedTransition(widget.transition.id);
                  },
                ),
                loading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                            height: AppDimensions.iconSizeMedium,
                            width: AppDimensions.iconSizeMedium,
                            child: CircularProgressIndicator()),
                      )
                    : IconButton(
                        icon: userInputProvider
                                .isTransitionDownloaded(widget.transition.id)
                            ? const Icon(
                                Icons.download_for_offline,
                                color: ACCENT_COLOR,
                                size: STANDART_ICON_SIZE_BIG,
                              )
                            : const Icon(
                                Icons.download_for_offline_outlined,
                                color: TEXT_COLOR,
                                size: STANDART_ICON_SIZE_BIG,
                              ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          await userInputProvider
                              .toggleDownloadedTransition(widget.transition.id);
                          setState(() {
                            loading = false;
                          });
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
