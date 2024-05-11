// search_view_model.dart
import 'package:acronyc_app/services/local_storage/local_storage_service.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';

class UserInputProvider extends ChangeNotifier {
  List<String> marketAsanas = [];
  List<String> completedAsanas = [];
  List<String> markedWashingMachines = [];
  List<String> completedWashingMachines = [];

  UserInputProvider() {
    initialize();
  }

  void initialize() {
    marketAsanas = LocalStorageService.get(Preferences.markedAsanas) ?? [];
    completedAsanas =
        LocalStorageService.get(Preferences.completedAsanas) ?? [];
    markedWashingMachines =
        LocalStorageService.get(Preferences.markedWashingMachines) ?? [];
    completedWashingMachines =
        LocalStorageService.get(Preferences.completedWashingMachines) ?? [];
  }

  void toggleMarked(String asanaId) {
    if (marketAsanas.contains(asanaId)) {
      marketAsanas.remove(asanaId);
    } else {
      marketAsanas.add(asanaId);
    }
    LocalStorageService.set(Preferences.markedAsanas, marketAsanas);
    notifyListeners();
  }

  void toggleCompleted(String asanaId) {
    if (completedAsanas.contains(asanaId)) {
      completedAsanas.remove(asanaId);
    } else {
      completedAsanas.add(asanaId);
    }
    LocalStorageService.set(Preferences.completedAsanas, completedAsanas);
    notifyListeners();
  }

  void toggleMarkedWashingMachine(String washingMachineId) {
    if (markedWashingMachines.contains(washingMachineId)) {
      markedWashingMachines.remove(washingMachineId);
    } else {
      markedWashingMachines.add(washingMachineId);
    }
    LocalStorageService.set(
        Preferences.markedWashingMachines, markedWashingMachines);
    notifyListeners();
  }

  void toggleCompletedWashingMachine(String washingMachineId) {
    if (completedWashingMachines.contains(washingMachineId)) {
      completedWashingMachines.remove(washingMachineId);
    } else {
      completedWashingMachines.add(washingMachineId);
    }
    LocalStorageService.set(
        Preferences.completedWashingMachines, completedWashingMachines);
    notifyListeners();
  }

  bool isAsanaMarked(String asanaId) {
    return marketAsanas.contains(asanaId);
  }

  bool isAsanaCompleted(String asanaId) {
    return completedAsanas.contains(asanaId);
  }

  bool isWashingMachineMarked(String washingMachineId) {
    return markedWashingMachines.contains(washingMachineId);
  }

  bool isWashingMachineCompleted(String washingMachineId) {
    return completedWashingMachines.contains(washingMachineId);
  }
}
