import 'package:acronyc_app/data/data_json.dart';
import 'package:acronyc_app/models/asana_model.dart';
import 'package:acronyc_app/models/transition_model.dart';
import 'package:acronyc_app/models/washing_machines_model.dart';

class DataSingelton {
  static final DataSingelton _instance = DataSingelton._internal();
  factory DataSingelton() => _instance;
  DataSingelton._internal();

  List<AsanaModel> asanas = [];
  List<WashingMachinesModel> washingMachines = [];
  List<TransitionModel> transitions = [];

  void initializeData() {
    try {
      asanas = dataJson['asanas']!
          .map<AsanaModel>((asana) => AsanaModel.fromJson(asana))
          .toList();
      washingMachines = dataJson['washing_machines']!
          .map<WashingMachinesModel>((wm) => WashingMachinesModel.fromJson(wm))
          .toList();
      transitions = dataJson['transitions']!
          .map<TransitionModel>(
              (transition) => TransitionModel.fromJson(transition))
          .toList();
    } catch (e) {
      print(e);
      print(StackTrace.current);
    }
  }

  AsanaModel getAsanaFromId(String id) {
    return asanas.firstWhere((element) => element.id == id);
  }

  WashingMachinesModel getWashingMachineFromId(String id) {
    return washingMachines.firstWhere((element) => element.id == id);
  }

  TransitionModel getTransitionFromId(String id) {
    return transitions.firstWhere((element) => element.id == id);
  }

  List<TransitionModel> getTransitionsFromAsanaId(String id) {
    return transitions.where((element) => element.startAsanaId == id).toList();
  }
}
