import 'package:acronyc_app/layouts/main_body_padding.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:acronyc_app/utiles/text_styles.dart';
import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';

class SingleAsanaPage extends StatefulWidget {
  const SingleAsanaPage({super.key});

  @override
  State<SingleAsanaPage> createState() => _SingleAsanaPageState();
}

class _SingleAsanaPageState extends State<SingleAsanaPage> {
  final ScrollController _controller = ScrollController();

  int index = 0;

  final int listLength = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          "Bird",
          style: MAIN_TITLE,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: MainBodyPadding(
          child: Column(
            children: [
              SizedBox(
                height: FLOW_SLIDER_HIGHT,
                child: AdaptiveScrollbar(
                    controller: _controller,
                    width: FLOW_SLIDER_INDICATOR_HIGHT,
                    position: ScrollbarPosition.bottom,
                    sliderDecoration: const BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    sliderActiveDecoration: const BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    underColor: Colors.transparent,
                    child: SingleChildScrollView(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        child: IntrinsicWidth(
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            ...[1, 2, 3, 4]
                                .map((index) => Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: FLOW_SLIDER_INDICATOR_HIGHT),
                                      child: Image.asset(
                                        "assets/images/acronyc_$index.png",
                                      ),
                                    ))
                                .toList()
                          ]),
                        ))),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      "assets/images/acronyc_${index + 1}.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  index != 0
                      ? Positioned(
                          height: 150,
                          left: 4,
                          child: GestureDetector(
                            onTap: () => setState(() {
                              index -= 1;
                            }),
                            child: SizedBox(
                              child: Image.asset(
                                "assets/icons/arrow_left.png",
                                color: PRIMARY_COLOR,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  index != listLength - 1
                      ? Positioned(
                          height: 150,
                          right: 4,
                          child: GestureDetector(
                            onTap: () => setState(() {
                              index += 1;
                            }),
                            child: SizedBox(
                              child: Image.asset(
                                "assets/icons/arrow_right.png",
                                color: PRIMARY_COLOR,
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: STANDART_TEXT_HORIZONTAL_PADDING),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Beschreibung", style: SUB_TITLE),
                    SizedBox(height: 10),
                    Text(
                      "Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen. Dann lässt sich der Flyer mit aufrechtem Ober- körper nach vorne kippen.",
                      style: STANDART_DESCRIPTION,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
