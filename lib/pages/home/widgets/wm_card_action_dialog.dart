import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/services/providers/filter_provider.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/local_storage/local_storage_service.dart';
import '../../../utiles/colors.dart';
import '../../../utiles/enums.dart';

class WmOptionDialog extends StatefulWidget {
  const WmOptionDialog({super.key, required this.wm});

  final WashingMachinesModel wm;

  @override
  State<WmOptionDialog> createState() => _WmOptionDialogState();
}

class _WmOptionDialogState extends State<WmOptionDialog> {
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
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(
                    15.0)), // Round corners for the top of the image
            child: Image.asset(
              widget.wm.steps[0].image,
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
                  icon: previousMarked
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
                    widget.wm.setIsMarked(!previousMarked).then((value) {
                      updateValues();
                      Provider.of<FilterProvider>(context, listen: false)
                          .refresh();
                    });
                  },
                ),
                IconButton(
                  icon: previousCompleted
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
                    widget.wm.setCompleted(!previousCompleted).then((value) {
                      updateValues();

                      Provider.of<FilterProvider>(context, listen: false)
                          .refresh();
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
