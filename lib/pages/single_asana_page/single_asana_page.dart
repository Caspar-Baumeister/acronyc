import 'dart:math';
import 'dart:ui';

import 'package:acronyc_app/pages/single_asana_page/widgets/app_bar_action_row.dart';
import 'package:flutter/material.dart';

import '../../models/asana_model.dart';
import '../../utiles/assets.dart';
import '../../utiles/colors.dart';
import '../../utiles/constants.dart';
import '../../utiles/helper_functions/steps_to_map.dart';
import '../../utiles/text_styles.dart';
import 'widgets/flow_scroll_view.dart';
import 'widgets/image_description_view.dart';
import 'widgets/main_image_view.dart';
import 'widgets/transition_view.dart';

class SingleAsanaPage extends StatefulWidget {
  const SingleAsanaPage({super.key, required this.asana});

  final AsanaModel asana;

  @override
  State<SingleAsanaPage> createState() => _SingleAsanaPageState();
}

class _SingleAsanaPageState extends State<SingleAsanaPage> {
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

    const double expandedHeight = EXPANDED_HEIGHT - kToolbarHeight;
    final double currentHeight =
        EXPANDED_HEIGHT - _scrollController.offset.clamp(0.0, expandedHeight);
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
    List<Widget> actions = [];

    actions.add(
      ValueListenableBuilder<double>(
        valueListenable: _percentageCollapsed,
        builder: (context, percentage, child) {
          print("percentage: $percentage");
          return Icon(
            Icons.star,
            color:
                percentage > APPBAR_COLLAPSED_PERCENTAGE ? WHITE1 : TEXT_COLOR,
          );
        },
      ),
    );

    actions.add(
      ValueListenableBuilder<double>(
        valueListenable: _percentageCollapsed,
        builder: (context, percentage, child) {
          return Icon(
            Icons.check_circle,
            color:
                percentage > APPBAR_COLLAPSED_PERCENTAGE ? WHITE1 : TEXT_COLOR,
          );
        },
      ),
    );

    return Scaffold(
        body: CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          leading: ValueListenableBuilder<double>(
            valueListenable: _percentageCollapsed,
            builder: (context, percentage, child) {
              return percentage > APPBAR_COLLAPSED_PERCENTAGE
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    )
                  : const BlurIconButton();
            },
          ),
          actions: [
            ValueListenableBuilder<double>(
                valueListenable: _percentageCollapsed,
                builder: (context, percentage, child) {
                  return AppBarActionRow(
                    asana: widget.asana,
                    isCollapsing: percentage > APPBAR_COLLAPSED_PERCENTAGE,
                  );
                })
          ],
          title: ValueListenableBuilder<double>(
            valueListenable: _percentageCollapsed,
            builder: (context, percentage, child) {
              if (percentage > APPBAR_COLLAPSED_PERCENTAGE) {
                return Text(
                  widget.asana.name.toUpperCase(),
                  maxLines: 2,
                  style: H14W5.copyWith(
                    color: percentage > APPBAR_COLLAPSED_PERCENTAGE
                        ? Colors.white
                        : Colors.black,
                  ),
                );
              }
              return Container(); // Empty container when expanded
            },
          ),
          centerTitle: true,
          expandedHeight: EXPANDED_HEIGHT,
          pinned: true,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const <StretchMode>[
              StretchMode.zoomBackground,
            ],
            background: Image.asset(
              widget.asana.img,
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
                        widget.asana.name.toUpperCase(),
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
                          widget.asana.steps.map((e) => e.image).toList(),
                      index: index,
                      setIndex: setIndex)),
              MainImageView(
                  index: index,
                  setIndex: setIndex,
                  imageLength: widget.asana.steps.length,
                  activeImage: widget.asana.steps[index].image),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: STANDART_HORIZONTAL_PADDING),
                child: ImageDescriptionView(
                    descriptions: generateDescriptionMap(widget.asana.steps),
                    index: index,
                    setIndex: setIndex,
                    header: "Eingang"),
              ),
              const SizedBox(height: 30),
              TransitionView(asana: widget.asana)
            ],
          ),
        ),
      ],
    ));
  }

  _actionRowWithBlur(double percentage, bool isCompleted, bool isMarked) {
    return AppBarActionRow(
      asana: widget.asana,
      isCollapsing: percentage > APPBAR_COLLAPSED_PERCENTAGE,
    );
  }
}

class BlurIconButton extends StatelessWidget {
  const BlurIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent, // Subdued color
          shape: BoxShape.circle, // Circular shape
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 8, sigmaY: 8), // Adjust blur values as needed
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
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
