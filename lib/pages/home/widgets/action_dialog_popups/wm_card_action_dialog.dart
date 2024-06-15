import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:acronyc_app/utiles/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utiles/colors.dart';

class WmOptionDialog extends StatefulWidget {
  const WmOptionDialog({super.key, required this.wm});

  final WashingMachinesModel wm;

  @override
  State<WmOptionDialog> createState() => _WmOptionDialogState();
}

class _WmOptionDialogState extends State<WmOptionDialog> {
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
              imageUrl: widget.wm.steps.last.image,
              poseIdentifier: widget.wm.name,
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
                  icon: userInputProvider.isWashingMachineMarked(widget.wm.name)
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
                        .toggleMarkedWashingMachine(widget.wm.name);
                  },
                ),
                IconButton(
                  icon: userInputProvider
                          .isWashingMachineCompleted(widget.wm.name)
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
                        .toggleCompletedWashingMachine(widget.wm.name);
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
                                .isWashingMachineDownloaded(widget.wm.name)
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
                              .toggleDownloadedWashingMachine(widget.wm.name);
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
