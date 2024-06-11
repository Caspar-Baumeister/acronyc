import 'package:acronyc_app/pages/explenation_pages/single_transition_page/single_transition_body.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';

import '../../../models/transition_model.dart';
import '../../../utiles/text_styles.dart';

class SingleTransitionPage extends StatelessWidget {
  const SingleTransitionPage({super.key, required this.transition});

  final TransitionModel transition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: BACKGROUND_COLOR,
          backgroundColor: BACKGROUND_COLOR,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          titleSpacing: 0,
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Image(image: transition.difficulty.icon),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: STANDART_HORIZONTAL_PADDING),
                  child: Text(
                    "${transition.startAsana.name} >> ${transition.endAsana.name}"
                        .toUpperCase(),
                    style: H14W5,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleTransitionBody(transition: transition));
  }
}
