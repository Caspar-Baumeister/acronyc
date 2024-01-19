import '../../models/step_model.dart';

Map<int, String> generateDescriptionMap(List<StepModel> steps) {
  Map<int, String> descriptionMap = {};

  for (int i = 0; i < steps.length; i++) {
    if (steps[i].description != null && steps[i].description!.isNotEmpty) {
      descriptionMap[i] = steps[i].description!;
    }
  }

  return descriptionMap;
}
