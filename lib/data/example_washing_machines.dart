// Example 1
import 'package:acronyc_app/data/example_asanas.dart';
import 'package:acronyc_app/models/step_model.dart';
import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/utiles/enums.dart';

WashingMachinesModel washingMachine1 = WashingMachinesModel(
  "beginner_flow_1",
  asanaIds: ["bird", "revered_foot_to_hand"],
  name: "Beginner Flow 1",
  steps: [
    ...exampleAsana0.steps,
    StepModel(
        image: "assets/images/asanas/reversed_foot_to_hand_0.jpg",
        description: "Transition from Bird to Reversed foot to hand"),
    ...exampleAsana1.steps,
  ],
  diffficulty: Difficulty.easy,
);

// Example 2
WashingMachinesModel washingMachine2 = WashingMachinesModel(
  "intermediate_flow_1",
  asanaIds: ["revered_foot_to_hand", "reversed_shoulder_stand"],
  name: "Intermediate Flow 1",
  steps: [
    ...exampleAsana1.steps,
    StepModel(
        image: "assets/images/asanas/reversed_foot_to_hand_0.jpg",
        description:
            "Transition from Reversed foot to hand to Reversed shoulder stand"),
    ...exampleAsana2.steps,
  ],
  diffficulty: Difficulty.medium,
);

// Example 3
WashingMachinesModel washingMachine3 = WashingMachinesModel(
  "mixed_flow_1",
  asanaIds: ["bird", "reversed_shoulder_stand"],
  name: "Mixed Flow 1",
  steps: [
    ...exampleAsana0.steps,
    StepModel(
        image: "assets/images/asanas/reversed_foot_to_hand_0.jpg",
        description: "Transition from Bird to Reversed shoulder stand"),
    ...exampleAsana2.steps,
  ],
  diffficulty: Difficulty.medium,
);

// list of all washing machines
List<WashingMachinesModel> washingMachines = [
  washingMachine1,
  washingMachine2,
  washingMachine3,
];

getWashingMachineFromId(id) {
  return washingMachines.firstWhere((element) => element.id == id);
}
