final dataJson = {
  "asanas": [
    {
      "id": "bird",
      "name": "Bird Longname",
      "image": "assets/images/asanas_base/bird.JPG",
      "steps": [
        {
          "image": "assets/images/asanas/bird_0.jpg",
          "description":
              "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Oberkörper nach vorne kippen"
        },
        {
          "image": "assets/images/asanas/bird_1.jpg",
          "description":
              "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine"
        },
        {
          "image": "assets/images/asanas/bird_2.jpg",
          "description":
              "um so den Flyer in den Bird schweben zu lassen. Die Beine der Base sind schließlich senkrecht gestreckt und die Arme von Base und Flyer bilden von Schulter zu Schulter eine gerade Linie"
        },
        {
          "image": "assets/images/asanas/bird_2.jpg",
          "description": "Nun ist es geschaft. Dies ist nur ein Test"
        },
        {"image": "assets/images/asanas/bird_2.jpg", "description": null}
      ],
      "difficulty": "easy"
    },
    {
      "id": "revered_foot_to_hand",
      "name": "Reversed foot to hand",
      "image": "assets/images/asanas/reversed_foot_to_hand.jpg",
      "steps": [
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_0.jpg",
          "description":
              "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen"
        },
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_1.jpg",
          "description":
              "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine"
        },
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_2.jpg",
          "description":
              "um so den Flyer in den Bird schweben zu lassen. Die Beine der Base sind schließ- lich senkrecht gestreckt und die Arme von Base und Flyer bilden von Schulter zu Schulter eine gerade Linie"
        },
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_3.jpg",
          "description": "Nun ist es geschaft. Dies ist nur ein Test"
        },
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_4.jpg",
          "description": null
        }
      ],
      "difficulty": "medium"
    },
    {
      "id": "reversed_shoulder_stand",
      "name": "Reversed shoulder stand",
      "image": "assets/images/asanas/reversed_shoulder_stand.jpg",
      "steps": [
        {
          "image": "assets/images/asanas/reversed_shoulder_stand_0.jpg",
          "description":
              "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen"
        },
        {
          "image": "assets/images/asanas/reversed_shoulder_stand_1.jpg",
          "description":
              "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine"
        },
        {
          "image": "assets/images/asanas/reversed_shoulder_stand_2.jpg",
          "description":
              "um so den Flyer in den Bird schweben zu lassen. Die Beine der Base sind schließ- lich senkrecht gestreckt und die Arme von Base und Flyer bilden von Schulter zu Schulter eine gerade Linie"
        },
        {
          "image": "assets/images/asanas/reversed_shoulder_stand_3.jpg",
          "description": "Nun ist es geschaft. Dies ist nur ein Test"
        },
        {
          "image": "assets/images/asanas/reversed_shoulder_stand_4.jpg",
          "description": null
        }
      ],
      "difficulty": "medium"
    }
  ],
  "transitions": [
    {
      "id": "bird-revered_foot_to_hand",
      "steps": [
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_0.jpg",
          "description":
              "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen"
        },
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_1.jpg",
          "description":
              "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine"
        },
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_2.jpg",
          "description": "Nun ist es geschaft. Dies ist nur ein Test"
        },
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_3.jpg",
          "description": null
        },
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_4.jpg",
          "description": null
        }
      ],
      "difficulty": "medium",
      "start_asana_id": "bird",
      "end_asana_id": "revered_foot_to_hand"
    }
  ],
  "washing_machines": [
    {
      "id": "crotch_paper_scissors",
      "name": "Crotch paper scissoers",
      "asana_ids": ["bird", "revered_foot_to_hand"],
      "steps": [
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_3.jpg",
          "description":
              "Transition from <Bird>(bird) to <Reversed foot to hand>(reversed_food_to_hand)"
        },
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_0.jpg",
          "description":
              "Transition from <Bird>(bird) to <Reversed foot to hand>(reversed_food_to_hand)"
        },
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_3.jpg",
          "description":
              "Transition from <Bird>(bird) to <Reversed foot to hand>(reversed_food_to_hand)"
        }
      ],
      "difficulty": "easy"
    },
    {
      "id": "hippie",
      "asana_ids": ["bird", "reversed_shoulder_stand"],
      "name": "HIPPIE",
      "steps": [
        {
          "image": "assets/images/asanas/reversed_foot_to_hand_0.jpg",
          "description": "Transition from Bird to Reversed shoulder stand"
        },
        {
          "image": "assets/images/asanas/reversed_shoulder_stand_0.jpg",
          "description":
              "Die Base setzt ihre Füße an die Hüftknochen des Flyers. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen"
        },
        {
          "image": "assets/images/asanas/reversed_shoulder_stand_1.jpg",
          "description":
              "Dabei gibt der Flyer seine Hände in die Hände der Base. Die Finger der Base zeigen dabei nach außen. Sobald die Base den Schwerpunkt des Flyers mit den Beinen spürt, streckt sie ihre Beine"
        },
        {
          "image": "assets/images/asanas/reversed_shoulder_stand_2.jpg",
          "description":
              "um so den Flyer in den Bird schweben zu lassen. Die Beine der Base sind schließ- lich senkrecht gestreckt und die Arme von Base und Flyer bilden von Schulter zu Schulter eine gerade Linie"
        },
        {
          "image": "assets/images/asanas/reversed_shoulder_stand_3.jpg",
          "description": "Nun ist es geschaft. Dies ist nur ein Test"
        },
        {
          "image": "assets/images/asanas/reversed_shoulder_stand_4.jpg",
          "description": null
        }
      ],
      "difficulty": "hard"
    }
  ]
};
