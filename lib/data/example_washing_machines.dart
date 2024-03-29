// Example 1
import 'package:acronyc_app/data/example_asanas.dart';
import 'package:acronyc_app/models/step_model.dart';
import 'package:acronyc_app/models/washing_machines_model.dart';
import 'package:acronyc_app/utiles/enums.dart';

WashingMachinesModel washingMachine1 = WashingMachinesModel(
  "crotch_paper_scissors",
  asanaIds: ["bird", "revered_foot_to_hand"],
  name: "CROTCH PAPER SCISSORS",
  steps: [
    ...exampleAsana0.steps,
    StepModel(
        image: "assets/images/asanas/reversed_foot_to_hand_0.jpg",
        description: "Transition from Bird to Reversed foot to hand"),
    ...exampleAsana1.steps,
  ],
  difficulty: Difficulty.easy,
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
  difficulty: Difficulty.medium,
);

// Example 3
WashingMachinesModel washingMachine3 = WashingMachinesModel(
  "hippie",
  asanaIds: ["bird", "reversed_shoulder_stand"],
  name: "HIPPIE",
  steps: [
    ...exampleAsana0.steps,
    StepModel(
        image: "assets/images/asanas/reversed_foot_to_hand_0.jpg",
        description: "Transition from Bird to Reversed shoulder stand"),
    ...exampleAsana2.steps,
  ],
  difficulty: Difficulty.medium,
);

// list of all washing machines
List<WashingMachinesModel> exampleWm = [
  washingMachine1,
  washingMachine2,
  washingMachine3,
];

getWashingMachineFromId(id) {
  return exampleWm.firstWhere((element) => element.id == id);
}
