import 'dart:ui';

import 'package:flutter/material.dart';

class BlurIconButton extends StatelessWidget {
  const BlurIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: ClipOval(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent, // Subdued color
            shape: BoxShape.circle, // Circular shape
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
