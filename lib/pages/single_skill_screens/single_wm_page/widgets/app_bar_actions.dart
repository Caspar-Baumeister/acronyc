import 'package:acronyc_app/models/transition_model.dart';
import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarActionsWm extends StatefulWidget {
  const AppBarActionsWm({
    super.key,
    required this.wm,
  });

  final WashingMachinesModel wm;

  @override
  State<AppBarActionsWm> createState() => _AppBarActionsWmState();
}

class _AppBarActionsWmState extends State<AppBarActionsWm> {
  bool loading = false;
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
              userInputProvider.toggleMarkedWashingMachine(widget.wm.name);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                userInputProvider.isWashingMachineMarked(widget.wm.name)
                    ? Icons.star
                    : Icons.star_border,
                color: userInputProvider.isWashingMachineMarked(widget.wm.name)
                    ? ACCENT_COLOR
                    : TEXT_COLOR,
                size: STANDART_ICON_SIZE_BIG,
              ),
            ),
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
          GestureDetector(
            onTap: () {
              userInputProvider.toggleCompletedWashingMachine(widget.wm.name);
            },
            child: Icon(
              userInputProvider.isWashingMachineCompleted(widget.wm.name)
                  ? Icons.check_circle
                  : Icons.check_circle_outline,
              color: userInputProvider.isWashingMachineCompleted(widget.wm.name)
                  ? ACCENT_COLOR
                  : TEXT_COLOR,
              size: STANDART_ICON_SIZE_BIG,
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarActionsTransition extends StatefulWidget {
  const AppBarActionsTransition({
    super.key,
    required this.transition,
  });

  final TransitionModel transition;

  @override
  State<AppBarActionsTransition> createState() =>
      _AppBarActionsTransitionState();
}

class _AppBarActionsTransitionState extends State<AppBarActionsTransition> {
  bool loading = false;
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
              userInputProvider.toggleMarkedTransition(widget.transition.id);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                userInputProvider.isTransitionMarked(widget.transition.id)
                    ? Icons.star
                    : Icons.star_border,
                color:
                    userInputProvider.isTransitionMarked(widget.transition.id)
                        ? ACCENT_COLOR
                        : TEXT_COLOR,
                size: STANDART_ICON_SIZE_BIG,
              ),
            ),
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
          GestureDetector(
            onTap: () {
              userInputProvider.toggleCompletedTransition(widget.transition.id);
            },
            child: Icon(
              userInputProvider.isTransitionCompleted(widget.transition.id)
                  ? Icons.check_circle
                  : Icons.check_circle_outline,
              color:
                  userInputProvider.isTransitionCompleted(widget.transition.id)
                      ? ACCENT_COLOR
                      : TEXT_COLOR,
              size: STANDART_ICON_SIZE_BIG,
            ),
          ),
        ],
      ),
    );
  }
}
