import 'dart:math';

import 'package:acronyc_app/models/transition_model.dart';
import 'package:acronyc_app/pages/single_skill_screens/single_wm_page/widgets/wm_asana_section.dart';
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
          Container(
            alignment: Alignment.centerLeft,
            padding:
                const EdgeInsets.symmetric(horizontal: AppPadding.paddingSmall),
            child: AsanaStructureSection(asanas: [
              widget.transition.startAsana.name,
              widget.transition.endAsana.name
            ]),
          ),
          SizedBox(
              height: FLOW_SLIDER_HIGHT,
              child: FlowScrollView(
                  poseIdentifier: widget.transition.id,
                  controller: controller,
                  activeImages:
                      widget.transition.steps.map((e) => e.image).toList(),
                  index: index,
                  setIndex: setIndex)),
          MainImageView(
              poseIdentifier: widget.transition.id,
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
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
