import 'dart:ui';

import 'package:acronyc_app/services/local_storage/local_storage_service.dart';
import 'package:acronyc_app/services/providers/filter_provider.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/asana_model.dart';

class AppBarActionRow extends StatefulWidget {
  const AppBarActionRow({
    super.key,
    required this.asana,
    required this.isCollapsing,
  });

  final AsanaModel asana;
  final bool isCollapsing;

  @override
  State<AppBarActionRow> createState() => _AppBarActionRowState();
}

class _AppBarActionRowState extends State<AppBarActionRow> {
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
    double blurFactor = widget.isCollapsing ? 0 : 8;
    return ClipOval(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent, // Subdued color
          shape: BoxShape.circle, // Circular shape
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: blurFactor,
              sigmaY: blurFactor), // Adjust blur values as needed
          child: SizedBox(
            height: 65,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // twi gesture detector with star and check icon with color and function depending on isCompleted and isMarked
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.asana.setIsMarked(!previousMarked).then((value) {
                        updateValues();
                        Provider.of<FilterProvider>(context, listen: false)
                            .refresh();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        widget.asana.isMarked ? Icons.star : Icons.star_border,
                        color:
                            widget.asana.isMarked ? ACCENT_COLOR : TEXT_COLOR,
                        size: STANDART_ICON_SIZE_BIG,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.asana
                          .setCompleted(!previousCompleted)
                          .then((value) {
                        updateValues();
                        Provider.of<FilterProvider>(context, listen: false)
                            .refresh();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                          widget.asana.isCompleted
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                          size: STANDART_ICON_SIZE_BIG,
                          color: widget.asana.isCompleted
                              ? ACCENT_COLOR
                              : TEXT_COLOR),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
