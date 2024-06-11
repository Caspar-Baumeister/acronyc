import 'dart:ui';

import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/asana_model.dart';

class AppBarActionRow extends StatelessWidget {
  const AppBarActionRow({
    super.key,
    required this.asana,
    required this.isCollapsing,
  });

  final AsanaModel asana;
  final bool isCollapsing;

  @override
  Widget build(BuildContext context) {
    UserInputProvider userInputProvider =
        Provider.of<UserInputProvider>(context);
    double blurFactor = isCollapsing ? 0 : 8;
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
                      userInputProvider.toggleMarked(asana.name);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        userInputProvider.isAsanaMarked(asana.name)
                            ? Icons.star
                            : Icons.star_border,
                        color: userInputProvider.isAsanaMarked(asana.name)
                            ? ACCENT_COLOR
                            : TEXT_COLOR,
                        size: STANDART_ICON_SIZE_BIG,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      userInputProvider.toggleCompleted(asana.name);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                          userInputProvider.isAsanaCompleted(asana.name)
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                          size: STANDART_ICON_SIZE_BIG,
                          color: userInputProvider.isAsanaCompleted(asana.name)
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
