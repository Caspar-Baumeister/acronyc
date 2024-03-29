import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/services/local_storage/local_storage_service.dart';
import 'package:acronyc_app/services/providers/filter_provider.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarActions extends StatefulWidget {
  const AppBarActions({
    super.key,
    required this.wm,
  });

  final WashingMachinesModel wm;

  @override
  State<AppBarActions> createState() => _AppBarActionsState();
}

class _AppBarActionsState extends State<AppBarActions> {
  late bool previousMarked;
  late bool previousCompleted;

  @override
  void initState() {
    super.initState();
    updateValues();
  }

  updateValues() {
    List<String> previousMarkedList =
        LocalStorageService.get(Preferences.markedWashingMachines) ?? [];
    List<String> previousCompletedList =
        LocalStorageService.get(Preferences.completedWashingMachines) ?? [];
    setState(() {
      previousMarked = previousMarkedList.contains(widget.wm.id);
      previousCompleted = previousCompletedList.contains(widget.wm.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // twi gesture detector with star and check icon with color and function depending on isCompleted and isMarked
        children: [
          GestureDetector(
            onTap: () {
              widget.wm.setIsMarked(!previousMarked).then((value) {
                updateValues();
                Provider.of<FilterProvider>(context, listen: false).refresh();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                widget.wm.isMarked ? Icons.star : Icons.star_border,
                color: widget.wm.isMarked ? ACCENT_COLOR : TEXT_COLOR,
                size: STANDART_ICON_SIZE_BIG,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.wm.setCompleted(!previousCompleted).then((value) {
                updateValues();
                Provider.of<FilterProvider>(context, listen: false).refresh();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                  widget.wm.isCompleted
                      ? Icons.check_circle
                      : Icons.check_circle_outline,
                  size: STANDART_ICON_SIZE_BIG,
                  color: widget.wm.isCompleted ? ACCENT_COLOR : TEXT_COLOR),
            ),
          ),
        ],
      ),
    );
  }
}
