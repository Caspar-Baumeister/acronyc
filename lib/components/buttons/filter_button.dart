import 'package:flutter/material.dart';

import '../../utiles/constants.dart';

class Filterbutton extends StatelessWidget {
  const Filterbutton({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        height: STANDART_ICON_SIZE,
        width: STANDART_ICON_SIZE,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: const Icon(
          Icons.filter_list,
          color: Colors.black,
        ),
      ),
    );
  }
}
