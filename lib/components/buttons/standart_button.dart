import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:acronyc_app/utiles/text_styles.dart';
import 'package:flutter/material.dart';

class StandartButton extends StatelessWidget {
  const StandartButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width = STANDART_BUTTON_WIDTH,
      this.disabled = false,
      this.loading = false,
      this.isFilled = false});

  final String text;
  final VoidCallback onPressed;
  final double width;
  final bool disabled;
  final bool loading;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: disabled || loading
          ? null
          // if authentication is not neccesary, return onPressed

          : onPressed,
      child: Container(
          decoration: BoxDecoration(
            color: isFilled ? BUTTON_FILL_COLOR : Colors.white,
            border: Border.all(color: BUTTON_FILL_COLOR),
            borderRadius: BorderRadius.circular(STANDART_BUTTON_ROUNDNESS),
          ),
          width: width,
          height: STANDART_BUTTON_HEIGHT,
          child: Center(
            child: loading
                ? Container(
                    height: STANDART_BUTTON_HEIGHT,
                    width: width,
                    padding: const EdgeInsets.all(5),
                    child: const CircularProgressIndicator())
                : Text(
                    text,
                    style: STANDART_BUTTON_TEXT.copyWith(
                      color: !isFilled ? BUTTON_FILL_COLOR : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
          )),
    );
  }
}
