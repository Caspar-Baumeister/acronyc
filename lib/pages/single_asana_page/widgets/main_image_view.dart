import 'package:flutter/material.dart';

import '../../../utiles/assets.dart';
import 'full_screen_view.dart';

class MainImageView extends StatelessWidget {
  const MainImageView(
      {super.key,
      required this.index,
      required this.setIndex,
      required this.imageLength,
      required this.activeImage});

  final int index;
  final Function setIndex;
  final int imageLength;
  final String activeImage;
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
                  url: activeImage,
                  tag: activeImage,
                ),
              ));
            },
            child: Hero(
              tag: activeImage,
              child: Image.asset(
                activeImage,
                fit: BoxFit.cover,
                width: double.infinity,
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
