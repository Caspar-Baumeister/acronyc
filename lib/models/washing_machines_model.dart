import 'package:acronyc_app/services/local_storage/local_storage_service.dart';

import '../utiles/enums.dart';
import 'step_model.dart';

class WashingMachinesModel {
  final String id;

  final List<String> asanaIds;
  final String name;
  final List<StepModel> steps;
  final Difficulty difficulty;

  // define a getter to get the isNotDone value by checking if the id is in the shared preferences
  bool get isCompleted =>
      LocalStorageService.get(Preferences.completedWashingMachines)
          ?.contains(id) ??
      false;

  // define a setter to set the isNotDone value by checking if the id is in the shared preferences
  Future setCompleted(bool value) async {
    if (value) {
      // add the id to the shared preferences
      List<String> completedWashingMachines =
          LocalStorageService.get(Preferences.completedWashingMachines) ?? [];
      completedWashingMachines.add(id);
      LocalStorageService.set(
          Preferences.completedWashingMachines, completedWashingMachines);
    } else {
      // remove the id from the shared preferences
      List<String> completedWashingMachines =
          LocalStorageService.get(Preferences.completedWashingMachines) ?? [];
      completedWashingMachines.remove(id);
      LocalStorageService.set(
          Preferences.completedWashingMachines, completedWashingMachines);
    }
  }

  // define a getter to get the isMarked value by checking if the id is in the shared preferences
  bool get isMarked =>
      LocalStorageService.get(Preferences.markedWashingMachines)
          ?.contains(id) ??
      false;

  // define a setter to set the isMarked value by checking if the id is in the shared preferences
  Future setIsMarked(bool value) async {
    if (value) {
      // add the id to the shared preferences
      List<String> markedWashingMachines =
          LocalStorageService.get(Preferences.markedWashingMachines) ?? [];
      markedWashingMachines.add(id);

      LocalStorageService.set(
              Preferences.markedWashingMachines, markedWashingMachines)
          .then((value) {});
    } else {
      // remove the id from the shared preferences
      List<String> markedWashingMachines =
          LocalStorageService.get(Preferences.markedWashingMachines) ?? [];

      markedWashingMachines.remove(id);
      LocalStorageService.set(
          Preferences.markedWashingMachines, markedWashingMachines);
    }
  }

  WashingMachinesModel(
    this.id, {
    required this.asanaIds,
    required this.name,
    required this.steps,
    required this.difficulty,
  });
}
