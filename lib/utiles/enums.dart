// define a enum for difficulty [Beginner, Intermediate, Fortgeschritten, Alle]

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

// define a enum for type [L-Basing, Stehend, Beide]
enum AcrobaticsType { l_basing, standing, both }

// define extension for type

extension AcrobaticsTypeExtension on AcrobaticsType {
  String get name {
    switch (this) {
      case AcrobaticsType.l_basing:
        return "L-Basing";
      case AcrobaticsType.standing:
        return "Stehend";
      case AcrobaticsType.both:
        return "Beide";
      default:
        return "Beide";
    }
  }
}

// enum for preferences

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
