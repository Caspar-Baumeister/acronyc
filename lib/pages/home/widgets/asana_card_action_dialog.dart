import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/asana_model.dart';
import '../../../utiles/colors.dart';

class AsanaOptionDialog extends StatelessWidget {
  const AsanaOptionDialog({super.key, required this.asana});

  final AsanaModel asana;

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
            child: Image.asset(
              asana.image,
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
                  icon: userInputProvider.isAsanaMarked(asana.id)
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
                    userInputProvider.toggleMarked(asana.id);
                  },
                ),
                IconButton(
                  icon: userInputProvider.isAsanaCompleted(asana.id)
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
                    userInputProvider.toggleCompleted(asana.id);
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
