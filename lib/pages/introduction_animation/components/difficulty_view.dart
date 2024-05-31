import 'package:flutter/material.dart';

import '../../../utiles/assets.dart';
import '../../../utiles/enums.dart';
import 'difficulty_card.dart';

class DifficultyView extends StatelessWidget {
  final AnimationController animationController;

  const DifficultyView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final secondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final imageAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-4, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final relaxAnimation =
        Tween<Offset>(begin: const Offset(0, -2), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40)
                    .copyWith(top: 20),
                child: SlideTransition(
                  position: relaxAnimation,
                  child: const Text(
                    "Schwierigkeiten",
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SlideTransition(
                position: imageAnimation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DifficultyCard(
                        difficultyImage: Assets.easy,
                        text: Difficulty.easy.name,
                        assetImage:
                            'assets/images/introduction_animation/1IMGP3160p.jpg'),
                    DifficultyCard(
                        difficultyImage: Assets.medium,
                        text: Difficulty.medium.name,
                        assetImage:
                            'assets/images/introduction_animation/5IMGP7978p.jpg')
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SlideTransition(
                  position: imageAnimation,
                  child: DifficultyCard(
                      difficultyImage: Assets.hard,
                      text: Difficulty.hard.name,
                      assetImage: 'assets/images/acronyc_expample.png')),
            ],
          ),
        ),
      ),
    );
  }
}
