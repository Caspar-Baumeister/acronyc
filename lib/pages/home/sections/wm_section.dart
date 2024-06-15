import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/pages/home/sections/base_grid_view.dart';
import 'package:acronyc_app/pages/home/widgets/grid_view_cards/grid_view_wm_card.dart';
import 'package:acronyc_app/services/data_singelton.dart';
import 'package:acronyc_app/services/providers/filter_provider.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WmSection extends StatelessWidget {
  const WmSection({super.key});

  @override
  Widget build(BuildContext context) {
    UserInputProvider userInputProvider =
        Provider.of<UserInputProvider>(context);
    FilterProvider filterProvider = Provider.of<FilterProvider>(context);
    return BaseGridViewSection(
        children: getWashingMachines(userInputProvider, filterProvider)
            .map(
              (wm) => GridViewWmCard(wm: wm),
            )
            .toList());
  }

  List<WashingMachinesModel> getWashingMachines(
      UserInputProvider userInputProvider, FilterProvider filterProvider) {
    final DataSingelton dataSingelton = DataSingelton();
    List<WashingMachinesModel> wm = dataSingelton.washingMachines;

    String search = filterProvider.search;
    Difficulty activeDifficulty = filterProvider.activeDifficulty;
    bool isMarkedFilter = filterProvider.isMarkedFilter;
    bool isNotDoneFilter = filterProvider.isNotDoneFilter;

    // apply search query
    if (search.isNotEmpty) {
      wm = wm
          .where((wm) => wm.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    // apply difficulty filter
    if (activeDifficulty != Difficulty.all) {
      wm = wm.where((wm) => wm.difficulty == activeDifficulty).toList();
    }

    // apply marked filter
    if (isMarkedFilter) {
      wm = wm
          .where((wm) => userInputProvider.isWashingMachineMarked(wm.name))
          .toList();
    }

    // apply done filter
    if (isNotDoneFilter) {
      wm = wm
          .where((wm) => !userInputProvider.isWashingMachineCompleted(wm.name))
          .toList();
    }

    // apply downloaded filter
    if (filterProvider.isDownloadedFilter) {
      wm = wm
          .where((wm) => userInputProvider.isWashingMachineDownloaded(wm.name))
          .toList();
    }

    return wm;
  }
}
