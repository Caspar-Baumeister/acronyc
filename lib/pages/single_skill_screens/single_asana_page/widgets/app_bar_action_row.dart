import 'dart:ui';

import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/asana_model.dart';

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
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    UserInputProvider userInputProvider =
        Provider.of<UserInputProvider>(context);
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
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // twi gesture detector with star and check icon with color and function depending on isCompleted and isMarked
                children: [
                  GestureDetector(
                    onTap: () {
                      userInputProvider.toggleMarked(widget.asana.name);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        userInputProvider.isAsanaMarked(widget.asana.name)
                            ? Icons.star
                            : Icons.star_border,
                        color:
                            userInputProvider.isAsanaMarked(widget.asana.name)
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
                                  .isAsanaDownloaded(widget.asana.name)
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
                                .toggleDownloadedAsana(widget.asana.name);
                            setState(() {
                              loading = false;
                            });
                          },
                        ),
                  GestureDetector(
                    onTap: () {
                      userInputProvider.toggleCompleted(widget.asana.name);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                          userInputProvider.isAsanaCompleted(widget.asana.name)
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                          size: STANDART_ICON_SIZE_BIG,
                          color: userInputProvider
                                  .isAsanaCompleted(widget.asana.name)
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
