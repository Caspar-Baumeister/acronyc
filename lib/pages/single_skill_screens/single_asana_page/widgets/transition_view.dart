import 'package:acronyc_app/pages/home/sections/asana_section.dart';
import 'package:acronyc_app/services/download_services/image_downloader.dart';
import 'package:acronyc_app/services/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/asana_model.dart';
import '../../../../utiles/constants.dart';
import '../../../../utiles/text_styles.dart';
import '../../../home/widgets/grid_view_cards/grid_view_transition_card.dart';

class TransitionView extends StatelessWidget {
  const TransitionView({super.key, required this.asana});

  final AsanaModel asana;

  @override
  Widget build(BuildContext context) {
    FilterProvider filterProvider = Provider.of<FilterProvider>(context);
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: STANDART_HORIZONTAL_PADDING),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transitions vom ${asana.name.toUpperCase()}",
            style: SUB_TITLE,
            maxLines: 2,
          ),
          const SizedBox(height: 12),
          filterProvider.isDownloadedFilter
              ? Padding(
                  padding:
                      const EdgeInsets.only(bottom: AppPadding.paddingMedium),
                  child: Row(
                    children: [
                      const Text(
                        "Offline Modus aktiviert",
                        style: H14W5,
                      ),
                      const Spacer(),
                      CustomButtonComponent(
                        text: "deaktivieren",
                        onTap: () => filterProvider.toggleDownloaded(),
                        width: 120,
                      )
                    ],
                  ),
                )
              : const SizedBox(),
          GridView.count(
              padding: const EdgeInsets.only(top: 0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: asana.transitions.where((t) {
                if (filterProvider.isDownloadedFilter) {
                  return ImageDownloader().isDownloaded(t.id);
                }
                return true;
              }).map(
                (transition) {
                  return GridViewTransitionCard(
                    transition: transition,
                  );
                },
              ).toList()),
        ],
      ),
    );
  }
}
