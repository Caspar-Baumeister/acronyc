import 'dart:math';

import 'package:acronyc_app/models/transition_model.dart';
import 'package:acronyc_app/pages/explenation_pages/single_asana_page/single_asana_page.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../utiles/constants.dart';
import '../../../utiles/helper_functions/steps_to_map.dart';
import '../single_asana_page/widgets/flow_scroll_view.dart';
import '../single_asana_page/widgets/image_description_view.dart';
import '../single_asana_page/widgets/main_image_view.dart';

class SingleTransitionBody extends StatefulWidget {
  const SingleTransitionBody({super.key, required this.transition});
  final TransitionModel transition;

  @override
  State<SingleTransitionBody> createState() => _SingleTransitionBodyState();
}

class _SingleTransitionBodyState extends State<SingleTransitionBody> {
  int index = 0;
  final ScrollController controller = ScrollController();

  setIndex(newIndex) {
    controller.animateTo(
      min(newIndex * FLOW_SLIDER_SINGLE_IMAGE_WIDTH * 1.0,
          controller.position.maxScrollExtent),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              height: FLOW_SLIDER_HIGHT,
              child: FlowScrollView(
                  controller: controller,
                  activeImages:
                      widget.transition.steps.map((e) => e.image).toList(),
                  index: index,
                  setIndex: setIndex)),
          MainImageView(
              index: index,
              setIndex: setIndex,
              imageLength: widget.transition.steps.length,
              description: widget.transition.steps[index].description,
              activeImage: widget.transition.steps[index].image,
              steps: widget.transition.steps),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: STANDART_HORIZONTAL_PADDING),
            child: ImageDescriptionView(
                descriptions: generateDescriptionMap(widget.transition.steps),
                index: index,
                setIndex: setIndex,
                header: "Bescheibung"),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: STANDART_HORIZONTAL_PADDING),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        SingleAsanaPage(asana: widget.transition.endAsana),
                  ),
                ),
                child: Text(
                  "Weiter zu ${widget.transition.endAsana.name} >>",
                  style: SUB_TITLE.copyWith(color: ACCENT_COLOR_LIGHT),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
