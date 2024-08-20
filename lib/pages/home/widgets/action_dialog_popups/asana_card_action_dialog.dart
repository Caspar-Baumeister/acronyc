import 'package:acronyc_app/components/custom_cached_network_image.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/asana_model.dart';
import '../../../../utiles/colors.dart';

class AsanaOptionDialog extends StatefulWidget {
  const AsanaOptionDialog({super.key, required this.asana});

  final AsanaModel asana;

  @override
  State<AsanaOptionDialog> createState() => _AsanaOptionDialogState();
}

class _AsanaOptionDialogState extends State<AsanaOptionDialog> {
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
              poseIdentifier: widget.asana.name,
              imageUrl: widget.asana.image,
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
                  icon: userInputProvider.isAsanaMarked(widget.asana.name)
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
                    userInputProvider.toggleMarked(widget.asana.name);
                  },
                ),
                IconButton(
                  icon: userInputProvider.isAsanaCompleted(widget.asana.name)
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
                    userInputProvider.toggleCompleted(widget.asana.name);
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
