import '../utiles/enums.dart';
import 'step_model.dart';

class WashingMachinesModel {
  final String id;
  final bool isFavorite;
  final bool isDone;
  final List<String> asanaIds;
  final String name;
  final List<StepModel> steps;
  final Difficulty diffficulty;

  WashingMachinesModel(
    this.id, {
    this.isFavorite = false,
    this.isDone = false,
    required this.asanaIds,
    required this.name,
    required this.steps,
    required this.diffficulty,
  });
}
