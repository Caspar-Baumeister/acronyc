import 'package:acronyc_app/routing/routes/page_routes.dart';
import 'package:acronyc_app/services/data_singelton.dart';
import 'package:acronyc_app/services/download_services/image_downloader.dart';
import 'package:acronyc_app/services/providers/filter_provider.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/services/toast_service.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:acronyc_app/utiles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AsanaStructureSection extends StatelessWidget {
  const AsanaStructureSection({super.key, required this.asanas});

  final List<String> asanas;

  @override
  Widget build(BuildContext context) {
    UserInputProvider userInputProvider =
        Provider.of<UserInputProvider>(context);

    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 5,
      runSpacing: 5,
      children:
          _buildAsanaListWithSeparators(context, asanas, userInputProvider),
    );
  }

  List<Widget> _buildAsanaListWithSeparators(BuildContext context,
      List<String> asanas, UserInputProvider userInputProvider) {
    List<Widget> asanaWidgets = [];

    for (int i = 0; i < asanas.length; i++) {
      asanaWidgets.add(
        GestureDetector(
          onTap: () {
            if (!Provider.of<FilterProvider>(context, listen: false)
                    .isDownloadedFilter ||
                ImageDownloader().isDownloaded(asanas[i])) {
              Navigator.of(context).push(
                SingleAsanaPageRoute(
                    DataSingelton().getAsanaFromName(asanas[i])),
              );
            } else {
              CustomToast.showErrorToast(
                  "Bild nicht heruntergeladen und Offline-Modus aktiv");
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              asanas[i],
              style: CARD_SUBTITLE.copyWith(
                color: userInputProvider.isAsanaCompleted(asanas[i])
                    ? ACCENT_COLOR
                    : GRAY,
                fontWeight: userInputProvider.isAsanaCompleted(asanas[i])
                    ? FontWeight.bold
                    : FontWeight.normal,
                height: 1,
              ),
            ),
          ),
        ),
      );

      // Add separator ">" between asanas
      if (i < asanas.length - 1) {
        asanaWidgets.add(
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: AppDimensions.iconSizeSmall,
          ),
        );
      }
    }

    return asanaWidgets;
  }
}
