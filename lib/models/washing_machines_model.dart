import 'package:acronyc_app/data/wms/wm_steps_description.dart';
import 'package:acronyc_app/data/wms/wm_steps_images.dart';

import '../utiles/enums.dart';
import 'step_model.dart';

class WashingMachinesModel {
  final List<String> asanas;
  final String name;
  final List<StepModel> steps;
  final Difficulty difficulty;

  WashingMachinesModel({
    required this.asanas,
    required this.name,
    required this.steps,
    required this.difficulty,
  });

  factory WashingMachinesModel.fromJson(Map<String, dynamic> json) {
    List<StepModel> steps = [];
    try {
      wmImages[json['name']]!.forEach((int index, String image) {
        steps.add(StepModel.fromJson({
          'image': image,
          'description': wmStepsDescription[json['name']]![index],
        }));
      });
    } catch (e) {
      print(e);
      print(StackTrace.current);
    }
    return WashingMachinesModel(
      asanas: List<String>.from(json['asanas']),
      name: json['name'],
      steps: steps,
      difficulty: parseDifficulty(json['difficulty']),
    );
  }
}
