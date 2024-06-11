import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';

class CardDifficultyWidget extends StatelessWidget {
  const CardDifficultyWidget({
    super.key,
    required this.icon,
  });

  final AssetImage icon;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: icon,
      height: DIFFICULTY_ICON_HEIGHT,
      width: DIFFICULTY_ICON_WIDTH,
    );
  }
}
