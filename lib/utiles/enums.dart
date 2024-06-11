// define a enum for difficulty [Beginner, Intermediate, Fortgeschritten, Alle]
import 'package:acronyc_app/utiles/assets.dart';
import 'package:flutter/material.dart';

enum Difficulty { easy, medium, hard, all }

extension DifficultyExtension on Difficulty {
  String get name {
    switch (this) {
      case Difficulty.easy:
        return "Beginner";
      case Difficulty.medium:
        return "Intermediate";
      case Difficulty.hard:
        return "Fortgeschritten";
      case Difficulty.all:
        return "Alle";
      default:
        return "Alle";
    }
  }

  static Difficulty fromName(String name) {
    for (var difficulty in Difficulty.values) {
      if (difficulty.name == name) {
        return difficulty;
      }
    }
    throw Exception('No matching Difficulty for name: $name');
  }
}

// parse a string to the difficulty enum
Difficulty parseDifficulty(String difficulty) {
  switch (difficulty) {
    case "easy":
      return Difficulty.easy;
    case "medium":
      return Difficulty.medium;
    case "hard":
      return Difficulty.hard;
    default:
      return Difficulty.easy;
  }
}

// extension for Difficulty enum to get the icon
extension DifficultyIconExtension on Difficulty {
  AssetImage get icon {
    switch (this) {
      case Difficulty.easy:
        return Assets.easy;
      case Difficulty.medium:
        return Assets.medium;
      case Difficulty.hard:
        return Assets.hard;
      default:
        return Assets.hard;
    }
  }
}

enum Preferences {
  markedAsanas,
  completedAsanas,
  markedWashingMachines,
  completedWashingMachines,
}

extension PreferencesTypeExtension on Preferences {
  Type get getType {
    switch (this) {
      case Preferences.markedAsanas:
        return List<String>;
      case Preferences.completedAsanas:
        return List<String>;
      case Preferences.markedWashingMachines:
        return List<String>;
      case Preferences.completedWashingMachines:
        return List<String>;
      default:
        return String;
    }
  }
}
