import '../utiles/enums.dart';
import 'step_model.dart';

class WashingMachinesModel {
  final String id;
  final List<String> asanaIds;
  final String name;
  final List<StepModel> steps;
  final Difficulty difficulty;

  WashingMachinesModel({
    required this.id,
    required this.asanaIds,
    required this.name,
    required this.steps,
    required this.difficulty,
  });

  factory WashingMachinesModel.fromJson(Map<String, dynamic> json) {
    return WashingMachinesModel(
      id: json['id'],
      asanaIds: List<String>.from(json['asana_ids']),
      name: json['name'],
      steps: List<StepModel>.from(
          json['steps']?.map((x) => StepModel.fromJson(x)) ?? []),
      difficulty: parseDifficulty(json['difficulty']),
    );
  }
}
