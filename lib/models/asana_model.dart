import '../services/local_storage/local_storage_service.dart';
import '../utiles/enums.dart';
import 'step_model.dart';
import 'transition_model.dart';

class AsanaModel {
  String name;
  String id;
  List<StepModel> steps;
  List<TransitionModel> transitions;
  String img;
  Difficulty difficulty;

  // define a getter to get the isNotDone value by checking if the id is in the shared preferences
  bool get isCompleted =>
      LocalStorageService.get(Preferences.completedAsanas)?.contains(id) ??
      false;

  // define a setter to set the isNotDone value by checking if the id is in the shared preferences
  Future setCompleted(bool value) async {
    if (value) {
      // add the id to the shared preferences
      List<String> completedAsanas =
          LocalStorageService.get(Preferences.completedAsanas) ?? [];
      completedAsanas.add(id);
      LocalStorageService.set(Preferences.completedAsanas, completedAsanas);
    } else {
      // remove the id from the shared preferences
      List<String> completedAsanas =
          LocalStorageService.get(Preferences.completedAsanas) ?? [];
      completedAsanas.remove(id);
      LocalStorageService.set(Preferences.completedAsanas, completedAsanas);
    }
  }

  // define a getter to get the isMarked value by checking if the id is in the shared preferences
  bool get isMarked =>
      LocalStorageService.get(Preferences.markedAsanas)?.contains(id) ?? false;

  // define a setter to set the isMarked value by checking if the id is in the shared preferences
  Future setIsMarked(bool value) async {
    if (value) {
      // add the id to the shared preferences
      List<String> markedAsanas =
          LocalStorageService.get(Preferences.markedAsanas) ?? [];
      markedAsanas.add(id);
      print(markedAsanas);
      print("value: $value");
      LocalStorageService.set(Preferences.markedAsanas, markedAsanas)
          .then((value) {
        print("inside then future");
        print(LocalStorageService.get(Preferences.markedAsanas));
      });
      print("after future");
    } else {
      // remove the id from the shared preferences
      List<String> markedAsanas =
          LocalStorageService.get(Preferences.markedAsanas) ?? [];
      print(markedAsanas);
      print("value: $value");
      markedAsanas.remove(id);
      LocalStorageService.set(Preferences.markedAsanas, markedAsanas);
    }
  }

  AsanaModel(
      {required this.name,
      required this.id,
      this.steps = const [],
      this.transitions = const [],
      required this.difficulty,
      required this.img});
}
