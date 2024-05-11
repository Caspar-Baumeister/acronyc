// import '../models/asana_model.dart';
// import '../models/step_model.dart';
// import '../utiles/enums.dart';
// import 'example_transitions.dart';

// AsanaModel exampleAsana0 = AsanaModel(
//     id: "bird",
//     name: "Bird",
//     image: "assets/images/asanas_base/bird.JPG",
//     steps: [
//       StepModel(
//         image: "assets/images/asanas/bird_0.jpg",
//         description:
//             "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen",
//       ),
//       StepModel(
//         image: "assets/images/asanas/bird_1.jpg",
//         description:
//             "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine",
//       ),
//       StepModel(
//         image: "assets/images/asanas/bird_2.jpg",
//         description:
//             "um so den Flyer in den Bird schweben zu lassen. Die Beine der Base sind schließ- lich senkrecht gestreckt und die Arme von Base und Flyer bilden von Schulter zu Schulter eine gerade Linie",
//       ),
//       StepModel(
//           image: "assets/images/asanas/bird_2.jpg",
//           description: "Nun ist es geschaft. Dies ist nur ein Test"),
//       StepModel(
//         image: "assets/images/asanas/bird_2.jpg",
//       )
//     ],
//     transitions: [transition0],
//     difficulty: Difficulty.easy);

// AsanaModel exampleAsana1 = AsanaModel(
//     id: "revered_foot_to_hand",
//     name: "Reversed foot to hand",
//     image: "assets/images/asanas/reversed_foot_to_hand.jpg",
//     steps: [
//       StepModel(
//         image: "assets/images/asanas/reversed_foot_to_hand_0.jpg",
//         description:
//             "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen",
//       ),
//       StepModel(
//         image: "assets/images/asanas/reversed_foot_to_hand_1.jpg",
//         description:
//             "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine",
//       ),
//       StepModel(
//         image: "assets/images/asanas/reversed_foot_to_hand_2.jpg",
//         description:
//             "um so den Flyer in den Bird schweben zu lassen. Die Beine der Base sind schließ- lich senkrecht gestreckt und die Arme von Base und Flyer bilden von Schulter zu Schulter eine gerade Linie",
//       ),
//       StepModel(
//           image: "assets/images/asanas/reversed_foot_to_hand_3.jpg",
//           description: "Nun ist es geschaft. Dies ist nur ein Test"),
//       StepModel(image: "assets/images/asanas/reversed_foot_to_hand_4.jpg")
//     ],
//     transitions: [transition1],
//     difficulty: Difficulty.medium);

// AsanaModel exampleAsana2 = AsanaModel(
//     id: "reversed_shoulder_stand",
//     name: "Reversed shoulder stand",
//     image: "assets/images/asanas/reversed_shoulder_stand.jpg",
//     steps: [
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_0.jpg",
//         description:
//             "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen",
//       ),
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_1.jpg",
//         description:
//             "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine",
//       ),
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_2.jpg",
//         description:
//             "um so den Flyer in den Bird schweben zu lassen. Die Beine der Base sind schließ- lich senkrecht gestreckt und die Arme von Base und Flyer bilden von Schulter zu Schulter eine gerade Linie",
//       ),
//       StepModel(
//           image: "assets/images/asanas/reversed_shoulder_stand_3.jpg",
//           description: "Nun ist es geschaft. Dies ist nur ein Test"),
//       StepModel(image: "assets/images/asanas/reversed_shoulder_stand_4.jpg")
//     ],
//     transitions: [],
//     difficulty: Difficulty.medium);

// AsanaModel exampleAsana3 = AsanaModel(
//   id: "reversed_low_hand_to_foot",
//   name: "Reversed Low Hand to Foot",
//   image: "assets/images/asanas_base/lowf2h.jpg",
//   steps: [
//     StepModel(
//       image: "assets/images/asanas/reversed_shoulder_stand_0.jpg",
//       description:
//           "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen",
//     ),
//     StepModel(
//       image: "assets/images/asanas/reversed_shoulder_stand_1.jpg",
//       description:
//           "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine",
//     ),
//     StepModel(
//       image: "assets/images/asanas/reversed_shoulder_stand_2.jpg",
//       description:
//           "um so den Flyer in den Bird schweben zu lassen. Die Beine der Base sind schließ- lich senkrecht gestreckt und die Arme von Base und Flyer bilden von Schulter zu Schulter eine gerade Linie",
//     ),
//     StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_3.jpg",
//         description: "Nun ist es geschaft. Dies ist nur ein Test"),
//     StepModel(image: "assets/images/asanas/reversed_shoulder_stand_4.jpg")
//   ],
//   transitions: [],
//   difficulty: Difficulty.hard,
// );

// AsanaModel exampleAsana4 = AsanaModel(
//     id: "extended_reversed_hand_to_hand",
//     name: "Extended Reversed Hand to Hand",
//     image: "assets/images/asanas_base/ext_rev_h_2_h.jpg",
//     steps: [
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_0.jpg",
//         description:
//             "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen",
//       ),
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_1.jpg",
//         description:
//             "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine",
//       ),
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_2.jpg",
//         description:
//             "um so den Flyer in den Bird schweben zu lassen. Die Beine der Base sind schließ- lich senkrecht gestreckt und die Arme von Base und Flyer bilden von Schulter zu Schulter eine gerade Linie",
//       ),
//       StepModel(
//           image: "assets/images/asanas/reversed_shoulder_stand_3.jpg",
//           description: "Nun ist es geschaft. Dies ist nur ein Test"),
//       StepModel(image: "assets/images/asanas/reversed_shoulder_stand_4.jpg")
//     ],
//     transitions: [],
//     difficulty: Difficulty.hard);

// AsanaModel exampleAsana5 = AsanaModel(
//     id: "revered_hand_to_foot",
//     name: "Reversed Hand to Foot",
//     image: "assets/images/asanas_base/rev_h_2_f.jpg",
//     steps: [
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_0.jpg",
//         description:
//             "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen",
//       ),
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_1.jpg",
//         description:
//             "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine",
//       ),
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_2.jpg",
//         description:
//             "um so den Flyer in den Bird schweben zu lassen. Die Beine der Base sind schließ- lich senkrecht gestreckt und die Arme von Base und Flyer bilden von Schulter zu Schulter eine gerade Linie",
//       ),
//       StepModel(
//           image: "assets/images/asanas/reversed_shoulder_stand_3.jpg",
//           description: "Nun ist es geschaft. Dies ist nur ein Test"),
//       StepModel(image: "assets/images/asanas/reversed_shoulder_stand_4.jpg")
//     ],
//     transitions: [],
//     difficulty: Difficulty.hard);

// AsanaModel exampleAsana6 = AsanaModel(
//     id: "extended_hand_to_hand",
//     name: "Extended Hand to Hand",
//     image: "assets/images/asanas_base/ext_h_2_h.jpg",
//     steps: [
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_0.jpg",
//         description:
//             "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen",
//       ),
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_1.jpg",
//         description:
//             "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine",
//       ),
//       StepModel(
//         image: "assets/images/asanas/reversed_shoulder_stand_2.jpg",
//         description:
//             "um so den Flyer in den Bird schweben zu lassen. Die Beine der Base sind schließ- lich senkrecht gestreckt und die Arme von Base und Flyer bilden von Schulter zu Schulter eine gerade Linie",
//       ),
//       StepModel(
//           image: "assets/images/asanas/reversed_shoulder_stand_3.jpg",
//           description: "Nun ist es geschaft. Dies ist nur ein Test"),
//       StepModel(image: "assets/images/asanas/reversed_shoulder_stand_4.jpg")
//     ],
//     transitions: [],
//     difficulty: Difficulty.hard);

// List<AsanaModel> exampleAsanas = [
//   exampleAsana0,
//   exampleAsana1,
//   exampleAsana2,
//   exampleAsana3,
//   exampleAsana4,
//   exampleAsana5,
//   exampleAsana6
// ];

// getAsanaFromId(id) {
//   return exampleAsanas.firstWhere((element) => element.id == id);
// }
