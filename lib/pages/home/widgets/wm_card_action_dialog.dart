import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:acronyc_app/utiles/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utiles/colors.dart';

class WmOptionDialog extends StatelessWidget {
  const WmOptionDialog({super.key, required this.wm});

  final WashingMachinesModel wm;

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
            child: CustomCachedNetworkImage(
              imageUrl: wm.steps.last.image,
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
                  icon: userInputProvider.isWashingMachineMarked(wm.name)
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
                    userInputProvider.toggleMarkedWashingMachine(wm.name);
                  },
                ),
                IconButton(
                  icon: userInputProvider.isWashingMachineCompleted(wm.name)
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
                    userInputProvider.toggleCompletedWashingMachine(wm.name);
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
