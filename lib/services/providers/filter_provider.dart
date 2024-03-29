// search_view_model.dart
import 'package:acronyc_app/data/example_asanas.dart';
import 'package:acronyc_app/data/example_washing_machines.dart';
import 'package:acronyc_app/models/asana_model.dart';
import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  String search = '';
  Difficulty activeDifficulty = Difficulty.all;
  bool isMarked = false;
  bool isNotDone = false;

  void refresh() {
    notifyListeners();
  }

  void setSearchQuery(String query) {
    search = query;
    notifyListeners();
  }

  void setDifficulty(Difficulty difficulty) {
    activeDifficulty = difficulty;
    notifyListeners();
  }

  void toggleMarked() {
    isMarked = !isMarked;
    notifyListeners();
  }

  void toggleNotDone() {
    isNotDone = !isNotDone;
    notifyListeners();
  }

  void clearFilters() {
    activeDifficulty = Difficulty.all;
    isMarked = false;
    isNotDone = false;
    notifyListeners();
  }

  List<AsanaModel> getAsanas() {
    // TODO change this to get asanas from the real data
    List<AsanaModel> asanas = exampleAsanas;

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
    if (isMarked) {
      asanas = asanas.where((asana) => asana.isMarked).toList();
    }

    // apply done filter
    if (isNotDone) {
      asanas = asanas.where((asana) => !asana.isCompleted).toList();
    }

    return asanas;
  }

  List<WashingMachinesModel> getWm() {
    // TODO change this to get asanas from the real data
    List<WashingMachinesModel> wm = exampleWm;

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
    if (isMarked) {
      wm = wm.where((wm) => wm.isMarked).toList();
    }

    // apply done filter
    if (isNotDone) {
      wm = wm.where((wm) => !wm.isCompleted).toList();
    }

    return wm;
  }
}
