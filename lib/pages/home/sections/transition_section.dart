import 'package:acronyc_app/models/transition_model.dart';
import 'package:acronyc_app/pages/home/sections/base_grid_view.dart';
import 'package:acronyc_app/pages/home/widgets/grid_view_cards/grid_view_transition_card.dart';
import 'package:acronyc_app/services/data_singelton.dart';
import 'package:acronyc_app/services/providers/filter_provider.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransitionSection extends StatelessWidget {
  const TransitionSection({super.key});

  @override
  Widget build(BuildContext context) {
    UserInputProvider userInputProvider =
        Provider.of<UserInputProvider>(context);
    FilterProvider filterProvider = Provider.of<FilterProvider>(context);
    return BaseGridViewSection(
        children: getTransitions(userInputProvider, filterProvider)
            .map(
              (transition) => GridViewTransitionCard(transition: transition),
            )
            .toList());
  }

  List<TransitionModel> getTransitions(
      UserInputProvider userInputProvider, FilterProvider filterProvider) {
    final DataSingelton dataSingelton = DataSingelton();
    List<TransitionModel> transitions = dataSingelton.transitions;

    String search = filterProvider.search;
    Difficulty activeDifficulty = filterProvider.activeDifficulty;
    bool isMarkedFilter = filterProvider.isMarkedFilter;
    bool isNotDoneFilter = filterProvider.isNotDoneFilter;

    // apply search query
    if (search.isNotEmpty) {
      transitions = transitions
          .where((transition) =>
              transition.id.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    // apply difficulty filter
    if (activeDifficulty != Difficulty.all) {
      transitions = transitions
          .where((transitions) => transitions.difficulty == activeDifficulty)
          .toList();
    }

    // apply marked filter
    if (isMarkedFilter) {
      transitions = transitions
          .where((transitions) =>
              userInputProvider.isTransitionMarked(transitions.id))
          .toList();
    }

    // apply done filter
    if (isNotDoneFilter) {
      transitions = transitions
          .where((transitions) =>
              !userInputProvider.isTransitionCompleted(transitions.id))
          .toList();
    }

    // apply downloaded filter
    if (filterProvider.isDownloadedFilter) {
      transitions = transitions
          .where((transitions) =>
              userInputProvider.isTransitionDownloaded(transitions.id))
          .toList();
    }

    return transitions;
  }
}
