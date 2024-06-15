import 'package:acronyc_app/data/all_data.dart';
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
      asanas = allData['asanas']!
          .map<AsanaModel>((asana) => AsanaModel.fromJson(asana))
          .toList();
      washingMachines = allData['washing_machines']!
          .map<WashingMachinesModel>((wm) => WashingMachinesModel.fromJson(wm))
          .toList();
      transitions = allData['transitions']!
          .map<TransitionModel>(
              (transition) => TransitionModel.fromJson(transition))
          .toList();
    } catch (e) {
      print(e);
      print(StackTrace.current);
    }
  }

  AsanaModel getAsanaFromName(String name) {
    return asanas.firstWhere((element) => element.name == name);
  }

  WashingMachinesModel getWashingMachineFromName(String name) {
    return washingMachines.firstWhere((element) => element.name == name);
  }

  TransitionModel getTransitionFromId(String id) {
    return transitions.firstWhere((element) => element.id == id);
  }

  List<TransitionModel> getTransitionsFromAsanaId(String id) {
    return transitions
        .where((element) => element.startAsanaName == id)
        .toList();
  }
}
