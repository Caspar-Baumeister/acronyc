import 'package:acronyc_app/data/transitions/transition_images.dart';
import 'package:acronyc_app/data/transitions/transitions_descriptions.dart';
import 'package:acronyc_app/services/data_singelton.dart';

import '../utiles/enums.dart';
import 'asana_model.dart';
import 'step_model.dart';

class TransitionModel {
  String id;
  Difficulty difficulty;
  String endAsanaName;
  String startAsanaName;
  List<StepModel> steps;

  final DataSingelton _dataSingelton = DataSingelton();
  // get the start asana from the startAsanaId
  AsanaModel get startAsana {
    return _dataSingelton.getAsanaFromName(startAsanaName);
  }

  // get the end asana from the endAsanaId
  AsanaModel get endAsana {
    return _dataSingelton.getAsanaFromName(endAsanaName);
  }

  TransitionModel({
    required this.id,
    required this.difficulty,
    required this.steps,
    required this.endAsanaName,
    required this.startAsanaName,
  });

  factory TransitionModel.fromJson(Map<String, dynamic> json) {
    List<StepModel> steps = [];
    try {
      transitionImages[json['id']]!.forEach((int index, String image) {
        steps.add(StepModel.fromJson({
          'image': image,
          'description': transitionDescriptions[json['start_asana_name']]![
              json['id']]![index],
        }));
      });
    } catch (e) {
      print(e);
      print(StackTrace.current);
    }
    return TransitionModel(
      id: json['id'],
      steps: steps,
      difficulty: parseDifficulty(json['difficulty']),
      startAsanaName: json['start_asana_name'],
      endAsanaName: json['end_asana_name'],
    );
  }
}
