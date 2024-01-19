import 'package:flutter/material.dart';

class DifficultyCard extends StatelessWidget {
  const DifficultyCard(
      {super.key,
      required this.difficultyImage,
      required this.text,
      required this.assetImage});

  final AssetImage difficultyImage;
  final String text;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 300, maxHeight: 200),
          child: Stack(
            children: [
              Image.asset(
                assetImage,
                fit: BoxFit.contain,
              ),
              Positioned(
                top: 15,
                right: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Image(image: difficultyImage),
                ),
              )
            ],
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
