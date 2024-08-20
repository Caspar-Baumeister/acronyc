import 'package:acronyc_app/components/custom_cached_network_image.dart';
import 'package:acronyc_app/models/step_model.dart';
import 'package:flutter/material.dart';

import '../../../../utiles/assets.dart';
import '../../../full_screen_pages/full_screen_step_page.dart';

class MainImageView extends StatelessWidget {
  const MainImageView(
      {super.key,
      required this.index,
      required this.setIndex,
      required this.imageLength,
      required this.activeImage,
      required this.description,
      required this.steps,
      required this.poseIdentifier});

  final int index;
  final Function setIndex;
  final int imageLength;
  final String activeImage;
  final String? description;
  final List<StepModel> steps;
  final String poseIdentifier;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipRRect(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FullScreenImageView(
                  steps: steps,
                  initialIndex: index,
                  changeIndex: setIndex,
                ),
              ));
            },
            child: Hero(
              tag: activeImage,
              child: CustomImageWrapper(
                poseIdentifier: poseIdentifier,
                imageUrl: activeImage,
                height: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
        index != 0
            ? Positioned(
                height: 150,
                left: 4,
                child: GestureDetector(
                  onTap: () => setIndex(index - 1),
                  child: Assets.arrowLeft,
                ),
              )
            : Container(),
        index != imageLength - 1
            ? Positioned(
                height: 150,
                right: 4,
                child: GestureDetector(
                    onTap: () => setIndex(index + 1), child: Assets.arrowRight),
              )
            : Container()
      ],
    );
  }
}
