import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/washing_machines_model.dart';
import '../../utiles/assets.dart';
import '../../utiles/constants.dart';
import '../../utiles/helper_functions/steps_to_map.dart';
import '../../utiles/text_styles.dart';
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
  final ScrollController controller = ScrollController();
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> _percentageCollapsed = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updatePercentage);
  }

  void _updatePercentage() {
    if (!_scrollController.hasClients) return;

    const double expandedHeight = 200.0 - kToolbarHeight;
    final double currentHeight =
        200.0 - _scrollController.offset.clamp(0.0, expandedHeight);
    final double percentage = 1.0 - (currentHeight / expandedHeight);
    _percentageCollapsed.value = percentage;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updatePercentage);
    _scrollController.dispose();
    _percentageCollapsed.dispose();
    super.dispose();
  }

  int index = 0;

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
        body: CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          leading: ValueListenableBuilder<double>(
            valueListenable: _percentageCollapsed,
            builder: (context, percentage, child) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: percentage > 0.5 ? Colors.white : Colors.black,
                onPressed: () => Navigator.pop(context),
              );
            },
          ),
          title: ValueListenableBuilder<double>(
            valueListenable: _percentageCollapsed,
            builder: (context, percentage, child) {
              if (percentage > 0.5) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Image(image: Assets.easy),
                    ),
                    Text(
                      widget.wm.name.toUpperCase(),
                      style: H14W5,
                    ),
                  ],
                );
              }
              return Container(); // Empty container when expanded
            },
          ),
          centerTitle: false,
          expandedHeight: 200.0,
          pinned: true,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const <StretchMode>[
              StretchMode.zoomBackground,
            ],
            background: Image.asset(
              widget.wm.steps[0].image,
              fit: BoxFit.cover,
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Image(image: Assets.easy),
                    ),
                    Flexible(
                      child: Text(
                        widget.wm.name,
                        style: SUB_TITLE,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: FLOW_SLIDER_HIGHT,
                  child: FlowScrollView(
                      controller: controller,
                      activeImages:
                          widget.wm.steps.map((e) => e.image).toList(),
                      index: index,
                      setIndex: setIndex)),
              MainImageView(
                  index: index,
                  setIndex: setIndex,
                  imageLength: widget.wm.steps.length,
                  activeImage: widget.wm.steps[index].image),
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
        // You can add more slivers if needed
      ],
    ));
  }
}
