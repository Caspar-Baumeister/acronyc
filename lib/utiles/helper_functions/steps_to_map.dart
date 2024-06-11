import '../../models/step_model.dart';

// takes a list of steps and returns a map of step number to description
Map<int, String> generateDescriptionMap(List<StepModel> steps) {
  Map<int, String> descriptionMap = {};

  if (steps[0].description == null) {
    // set steps[0] to first non-null description
    for (int i = 1; i < steps.length; i++) {
      if (steps[i].description != null) {
        steps[0] = steps[i];
        break;
      }
    }
  }

  for (int i = 0; i < steps.length; i++) {
    if (steps[i].description != null && steps[i].description!.isNotEmpty) {
      descriptionMap[i] = steps[i].description!;
    }
  }

  return descriptionMap;
}
