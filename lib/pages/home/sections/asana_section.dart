import 'package:acronyc_app/models/asana_model.dart';
import 'package:acronyc_app/pages/home/sections/base_grid_view.dart';
import 'package:acronyc_app/services/data_singelton.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../services/providers/filter_provider.dart';
import '../widgets/grid_view_cards/grid_view_asana_card.dart';

class AsanaSection extends StatelessWidget {
  const AsanaSection({super.key});

  @override
  Widget build(BuildContext context) {
    UserInputProvider userInputProvider =
        Provider.of<UserInputProvider>(context);
    FilterProvider filterProvider = Provider.of<FilterProvider>(context);

    List<AsanaModel> asanas = getAsanas(userInputProvider, filterProvider);

    return BaseGridViewSection(
        children: asanas
            .map(
              (asana) => GridViewAsanaCard(
                asana: asana,
              ),
            )
            .toList());
  }

  List<AsanaModel> getAsanas(
      UserInputProvider userInputProvider, FilterProvider filterProvider) {
    final DataSingelton dataSingelton = DataSingelton();
    List<AsanaModel> asanas = dataSingelton.asanas;

    String search = filterProvider.search;
    bool isMarkedFilter = filterProvider.isMarkedFilter;
    bool isNotDoneFilter = filterProvider.isNotDoneFilter;

    // apply search query
    if (search.isNotEmpty) {
      asanas = asanas
          .where((asana) =>
              asana.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    // apply marked filter
    if (isMarkedFilter) {
      asanas = asanas
          .where((asana) => userInputProvider.isAsanaMarked(asana.name))
          .toList();
    }

    // apply done filter
    if (isNotDoneFilter) {
      asanas = asanas
          .where((asana) => !userInputProvider.isAsanaCompleted(asana.name))
          .toList();
    }

    // apply downloaded filter
    if (filterProvider.isDownloadedFilter) {
      asanas = asanas
          .where((asana) => userInputProvider.isAsanaDownloaded(asana.name))
          .toList();
    }

    return asanas;
  }
}
