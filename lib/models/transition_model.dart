import '../data/example_asanas.dart';
import '../utiles/enums.dart';
import 'asana_model.dart';
import 'step_model.dart';

class TransitionModel {
  String name;
  String id;
  Difficulty difficulty;
  String endAsanaId;
  String startAsanaId;
  List<StepModel> steps;
  // get the start asana from the startAsanaId
  AsanaModel get startAsana {
    return exampleAsanas.firstWhere((element) => element.id == startAsanaId);
  }

  // get the end asana from the endAsanaId
  AsanaModel get endAsana {
    return exampleAsanas.firstWhere((element) => element.id == endAsanaId);
  }

  TransitionModel({
    required this.name,
    required this.id,
    required this.difficulty,
    required this.steps,
    required this.endAsanaId,
    required this.startAsanaId,
  });
}
