import 'dart:math';

import 'package:acronyc_app/pages/single_skill_screens/single_wm_page/widgets/app_bar_actions.dart';
import 'package:acronyc_app/pages/single_skill_screens/single_wm_page/widgets/wm_asana_section.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';

import '../../../models/washing_machines_model.dart';
import '../../../utiles/constants.dart';
import '../../../utiles/helper_functions/steps_to_map.dart';
import '../../../utiles/text_styles.dart';
import '../single_asana_page/widgets/flow_scroll_view.dart';
import '../single_asana_page/widgets/image_description_view.dart';
import '../single_asana_page/widgets/main_image_view.dart';

class SingleWmPage extends StatefulWidget {
  const SingleWmPage({super.key, required this.wm});

  final WashingMachinesModel wm;

  @override
  State<SingleWmPage> createState() => _SingleWmPageState();
}

class _SingleWmPageState extends State<SingleWmPage> {
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
    return Scaffold(
      appBar: AppBar(
        //color: White,
        surfaceTintColor: BACKGROUND_COLOR,
        backgroundColor: BACKGROUND_COLOR,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image(image: widget.wm.difficulty.icon),
            ),
            Text(
              widget.wm.name.toUpperCase(),
              style: H14W5,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [AppBarActionsWm(wm: widget.wm)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.paddingSmall),
              child: AsanaStructureSection(asanas: widget.wm.asanas),
            ),
            SizedBox(
                height: FLOW_SLIDER_HIGHT,
                child: FlowScrollView(
                    poseIdentifier: widget.wm.name,
                    controller: controller,
                    activeImages: widget.wm.steps.map((e) => e.image).toList(),
                    index: index,
                    setIndex: setIndex)),
            MainImageView(
                poseIdentifier: widget.wm.name,
                index: index,
                setIndex: setIndex,
                description: widget.wm.steps[index].description,
                imageLength: widget.wm.steps.length,
                activeImage: widget.wm.steps[index].image,
                steps: widget.wm.steps),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: STANDART_HORIZONTAL_PADDING),
              child: ImageDescriptionView(
                  descriptions: generateDescriptionMap(widget.wm.steps),
                  index: index,
                  setIndex: setIndex,
                  header: "Bescheibung"),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
