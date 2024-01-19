import 'package:flutter/material.dart';

import '../assets.dart';
import '../enums.dart';

// extension for Difficulty enum to get the icon
extension DifficultyExtension on Difficulty {
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
