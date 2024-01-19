import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../utiles/text_styles.dart';

class ImageDescriptionView extends StatelessWidget {
  const ImageDescriptionView(
      {super.key,
      required this.descriptions,
      required this.index,
      required this.setIndex,
      required this.header});

  final Map<int, String> descriptions;
  final int index;
  final Function setIndex;
  final String header;

  @override
  Widget build(BuildContext context) {
    int highlightedKey = getKeyOrNextSmaller(index, descriptions);

    List<TextSpan> textSpans = descriptions.entries.map((entry) {
      return TextSpan(
          text: '${entry.value} ', // adding a space for separation
          style: STANDART_DESCRIPTION.copyWith(
              color: entry.key == highlightedKey
                  ? const Color.fromARGB(255, 0, 0, 0)
                  : const Color.fromARGB(40, 0, 0, 0)),
          recognizer: TapGestureRecognizer()
            ..onTap = () => setIndex(entry.key));
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: SUB_TITLE),
        const SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(children: textSpans),
        ),
      ],
    );
  }

  int getKeyOrNextSmaller(int index, Map<int, String> map) {
    int? closestKey;

    for (int key in map.keys) {
      if (key <= index && (closestKey == null || key > closestKey)) {
        closestKey = key;
      }
    }

    if (closestKey != null) {
      return closestKey;
    } else {
      throw Exception('No suitable key found.');
    }
  }
}
