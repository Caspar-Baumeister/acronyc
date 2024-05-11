import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({
    super.key,
    required this.wm,
  });

  final WashingMachinesModel wm;

  @override
  Widget build(BuildContext context) {
    UserInputProvider userInputProvider =
        Provider.of<UserInputProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // twi gesture detector with star and check icon with color and function depending on isCompleted and isMarked
        children: [
          GestureDetector(
            onTap: () {
              userInputProvider.toggleMarkedWashingMachine(wm.id);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                userInputProvider.isWashingMachineMarked(wm.id)
                    ? Icons.star
                    : Icons.star_border,
                color: userInputProvider.isWashingMachineMarked(wm.id)
                    ? ACCENT_COLOR
                    : TEXT_COLOR,
                size: STANDART_ICON_SIZE_BIG,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              userInputProvider.toggleCompletedWashingMachine(wm.id);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                userInputProvider.isWashingMachineCompleted(wm.id)
                    ? Icons.check_circle
                    : Icons.check_circle_outline,
                color: userInputProvider.isWashingMachineCompleted(wm.id)
                    ? ACCENT_COLOR
                    : TEXT_COLOR,
                size: STANDART_ICON_SIZE_BIG,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
