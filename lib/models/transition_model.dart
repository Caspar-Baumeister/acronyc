import 'package:acronyc_app/data/data_singelton.dart';

import '../utiles/enums.dart';
import 'asana_model.dart';
import 'step_model.dart';

class TransitionModel {
  String id;
  Difficulty difficulty;
  String endAsanaId;
  String startAsanaId;
  List<StepModel> steps;

  final DataSingelton _dataSingelton = DataSingelton();
  // get the start asana from the startAsanaId
  AsanaModel get startAsana {
    return _dataSingelton.getAsanaFromId(startAsanaId);
  }

  // get the end asana from the endAsanaId
  AsanaModel get endAsana {
    return _dataSingelton.getAsanaFromId(endAsanaId);
  }

  TransitionModel({
    required this.id,
    required this.difficulty,
    required this.steps,
    required this.endAsanaId,
    required this.startAsanaId,
  });

  factory TransitionModel.fromJson(Map<String, dynamic> json) {
    return TransitionModel(
      id: json['id'],
      steps: List<StepModel>.from(
          json['steps']?.map((x) => StepModel.fromJson(x)) ?? []),
      difficulty: parseDifficulty(json['difficulty']),
      startAsanaId: json['start_asana_id'],
      endAsanaId: json['end_asana_id'],
    );
  }
}
