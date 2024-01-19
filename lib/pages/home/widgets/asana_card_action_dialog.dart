import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';

import '../../../models/asana_model.dart';
import '../../../services/local_storage/local_storage_service.dart';
import '../../../utiles/colors.dart';
import '../../../utiles/enums.dart';

class AsanaOptionDialog extends StatefulWidget {
  const AsanaOptionDialog({super.key, required this.asana});

  final AsanaModel asana;

  @override
  State<AsanaOptionDialog> createState() => _AsanaOptionDialogState();
}

class _AsanaOptionDialogState extends State<AsanaOptionDialog> {
  late bool previousMarked;
  late bool previousCompleted;

  @override
  void initState() {
    super.initState();
    updateValues();
  }

  updateValues() {
    List<String> previousMarkedList =
        LocalStorageService.get(Preferences.markedAsanas) ?? [];
    List<String> previousCompletedList =
        LocalStorageService.get(Preferences.completedAsanas) ?? [];
    setState(() {
      previousMarked = previousMarkedList.contains(widget.asana.id);
      previousCompleted = previousCompletedList.contains(widget.asana.id);
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
              widget.asana.img,
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
                    widget.asana
                        .setIsMarked(!previousMarked)
                        .then((value) => updateValues());
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
                    widget.asana
                        .setCompleted(!previousCompleted)
                        .then((value) => updateValues());
                  },
                ),
                // ... Add more options/icons here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
