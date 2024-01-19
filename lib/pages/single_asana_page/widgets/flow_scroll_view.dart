import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';

import '../../../utiles/colors.dart';
import '../../../utiles/constants.dart';

class FlowScrollView extends StatelessWidget {
  const FlowScrollView(
      {super.key,
      required this.controller,
      required this.activeImages,
      required this.index,
      required this.setIndex});

  final ScrollController controller;
  final List<String> activeImages;
  final int index;
  final Function setIndex;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScrollbar(
        controller: controller,
        width: FLOW_SLIDER_INDICATOR_HIGHT,
        position: ScrollbarPosition.bottom,
        sliderDecoration: const BoxDecoration(
            color: ACCENT_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        sliderActiveDecoration: const BoxDecoration(
            color: ACCENT_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        underColor: Colors.transparent,
        child: SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            child: IntrinsicWidth(
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List<Widget>.generate(activeImages.length, (i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: FLOW_SLIDER_INDICATOR_HIGHT),
                      child: GestureDetector(
                        onTap: () => setIndex(i),
                        child: i == index
                            ? Image.asset(
                                activeImages[i],
                                width: FLOW_SLIDER_SINGLE_IMAGE_WIDTH,
                              )
                            : Opacity(
                                opacity:
                                    0.5, // You can adjust this value as needed
                                child: Image.asset(
                                  activeImages[i],
                                  width: FLOW_SLIDER_SINGLE_IMAGE_WIDTH,
                                ),
                              ),
                      ),
                    );
                  })),
            )));
  }
}
