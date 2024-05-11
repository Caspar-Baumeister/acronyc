import 'package:acronyc_app/data/data_singelton.dart';

import '../utiles/enums.dart';
import 'step_model.dart';
import 'transition_model.dart';

class AsanaModel {
  String name;
  String id;
  List<StepModel> steps;

  String image;
  Difficulty difficulty;

  List<TransitionModel> get transitions {
    return DataSingelton().getTransitionsFromAsanaId(id);
  }

  AsanaModel(
      {required this.name,
      required this.id,
      this.steps = const [],
      required this.difficulty,
      required this.image});

  factory AsanaModel.fromJson(Map<String, dynamic> json) {
    return AsanaModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      steps: List<StepModel>.from(
          json['steps']?.map((x) => StepModel.fromJson(x)) ?? []),
      difficulty: parseDifficulty(json['difficulty']),
    );
  }
}
