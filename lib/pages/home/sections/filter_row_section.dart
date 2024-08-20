import 'package:acronyc_app/pages/home/widgets/filter_row_binary_item.dart';
import 'package:acronyc_app/pages/home/widgets/filter_row_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/providers/filter_provider.dart';
import '../../../utiles/constants.dart';
import '../../../utiles/enums.dart';

class FilterRowSection extends StatelessWidget {
  const FilterRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    FilterProvider asanaSearchProvider = Provider.of<FilterProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: STANDART_HORIZONTAL_PADDING),
          FilterRowBinaryItem(
            title: "Markiert",
            isActive: asanaSearchProvider.isMarkedFilter,
            changeActiveFilter: (_) {
              asanaSearchProvider.toggleMarked();
            },
          ),
          const SizedBox(width: 10),
          // TODO offen, geschafft auswählen
          FilterRowBinaryItem(
            title: "Nicht erlernt",
            isActive: asanaSearchProvider.isNotDoneFilter,
            changeActiveFilter: (_) {
              asanaSearchProvider.toggleNotDone();
            },
          ),
          const SizedBox(width: 10),
          FilterRowItem(
            hintText: "Schwierigkeit",
            eraseFilterOptionText: Difficulty.all.name,
            activeFilter: asanaSearchProvider.activeDifficulty.name,
            filterList: [
              Difficulty.easy.name,
              Difficulty.medium.name,
              Difficulty.hard.name
            ],
            changeActiveFilter: (String? filter) {
              if (filter == null) {
                asanaSearchProvider.setDifficulty(Difficulty.all);
              } else {
                asanaSearchProvider.setDifficulty(
                  DifficultyExtension.fromName(filter),
                );
              }
              return null;
            },
          ),
          const SizedBox(width: 10),
          FilterRowBinaryItem(
            title: "Offline Modus",
            isActive: asanaSearchProvider.isDownloadedFilter,
            changeActiveFilter: (_) {
              asanaSearchProvider.toggleDownloaded();
            },
          ),

          const SizedBox(width: STANDART_HORIZONTAL_PADDING),
        ],
      ),
    );
  }
}
