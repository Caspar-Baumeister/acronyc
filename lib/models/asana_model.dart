import 'package:acronyc_app/data/asana/asanas_entrance.dart';
import 'package:acronyc_app/data/asana/asanas_images.dart';
import 'package:acronyc_app/services/data_singelton.dart';

import 'step_model.dart';
import 'transition_model.dart';

class AsanaModel {
  String name;
  List<StepModel> steps;
  String image;

  List<TransitionModel> get transitions {
    return DataSingelton().getTransitionsFromAsanaId(name);
  }

  AsanaModel({required this.name, this.steps = const [], required this.image});

  factory AsanaModel.fromJson(Map<String, dynamic> json) {
    List<StepModel> steps = [];
    try {
      asanasImages[json['name']]!.forEach((int index, String image) {
        steps.add(StepModel.fromJson({
          'image': image,
          'description': asanaEntries[json['name']]![index],
        }));
      });
    } catch (e) {
      print(e);
      print(StackTrace.current);
    }
    return AsanaModel(
      name: json['name'],
      image: json['image'],
      steps: steps,
    );
  }
}
