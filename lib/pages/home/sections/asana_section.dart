import 'package:acronyc_app/data/data_singelton.dart';
import 'package:acronyc_app/models/asana_model.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/providers/filter_provider.dart';
import '../widgets/grid_view_asana_card.dart';

class AsanaSection extends StatelessWidget {
  const AsanaSection({super.key});

  @override
  Widget build(BuildContext context) {
    UserInputProvider userInputProvider =
        Provider.of<UserInputProvider>(context);
    FilterProvider filterProvider = Provider.of<FilterProvider>(context);

    return Consumer<FilterProvider>(
      builder: (context, asanaSearchProvider, _) => GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.8,
          children: getAsanas(userInputProvider, filterProvider)
              .map(
                (asana) => GridViewAsanaCard(
                  asana: asana,
                ),
              )
              .toList()),
    );
  }

  List<AsanaModel> getAsanas(
      UserInputProvider userInputProvider, FilterProvider filterProvider) {
    final DataSingelton dataSingelton = DataSingelton();
    List<AsanaModel> asanas = dataSingelton.asanas;

    String search = filterProvider.search;
    Difficulty activeDifficulty = filterProvider.activeDifficulty;
    bool isMarkedFilter = filterProvider.isMarkedFilter;
    bool isNotDoneFilter = filterProvider.isNotDoneFilter;

    // apply search query
    if (search.isNotEmpty) {
      asanas = asanas
          .where((asana) =>
              asana.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    // apply difficulty filter
    if (activeDifficulty != Difficulty.all) {
      asanas = asanas
          .where((asana) => asana.difficulty == activeDifficulty)
          .toList();
    }

    // apply marked filter
    if (isMarkedFilter) {
      asanas = asanas
          .where((asana) => userInputProvider.isAsanaMarked(asana.id))
          .toList();
    }

    // apply done filter
    if (isNotDoneFilter) {
      asanas = asanas
          .where((asana) => !userInputProvider.isAsanaCompleted(asana.id))
          .toList();
    }

    return asanas;
  }
}
