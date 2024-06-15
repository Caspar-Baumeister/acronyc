// search_view_model.dart
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  String search = '';
  Difficulty activeDifficulty = Difficulty.all;
  bool isMarkedFilter = false;
  bool isNotDoneFilter = false;
  bool isDownloadedFilter = false;

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
    isMarkedFilter = !isMarkedFilter;
    notifyListeners();
  }

  void toggleNotDone() {
    isNotDoneFilter = !isNotDoneFilter;
    notifyListeners();
  }

  void toggleDownloaded() {
    isDownloadedFilter = !isDownloadedFilter;
    notifyListeners();
  }

  void clearFilters() {
    activeDifficulty = Difficulty.all;
    isMarkedFilter = false;
    isNotDoneFilter = false;
    isDownloadedFilter = false;
    notifyListeners();
  }
}
