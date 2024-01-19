import 'package:flutter/material.dart';

import 'colors.dart';

class Assets {
  static AssetImage easy = const AssetImage("assets/icons/Mandala__leicht.png");

  static AssetImage medium =
      const AssetImage("assets/icons/Mandala__mittel.png");

  static AssetImage hard = const AssetImage("assets/icons/Mandala_schwer.png");

  static Widget asanaIcon = const Image(
    image: AssetImage("assets/icons/ai_pose2.png"),
    width: 30,
    height: 30,
    fit: BoxFit.cover,
  );

  static Widget transitionIcon = const Image(
    image: AssetImage("assets/icons/ai_pose3.png"),
    width: 30,
    height: 30,
    fit: BoxFit.cover,
  );

  static Widget washingmachineIcon = const Image(
    image: AssetImage("assets/icons/ai_pose1.png"),
    width: 30,
    height: 30,
    fit: BoxFit.cover,
  );

  static Widget profileIcon = const Image(
    image: AssetImage("assets/icons/ai_pose4.png"),
    width: 30,
    height: 30,
    fit: BoxFit.cover,
  );

  static ImageIcon arrowLeft = const ImageIcon(
    AssetImage("assets/icons/arrow_left.png"),
    color: ACCENT_COLOR,
  );

  static ImageIcon arrowRight = const ImageIcon(
    AssetImage(
      "assets/icons/arrow_right.png",
    ),
    color: ACCENT_COLOR,
  );
}
