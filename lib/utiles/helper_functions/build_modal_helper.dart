// builds the modal widgets
import 'package:flutter/material.dart';

Future<void> buildMortal(BuildContext context, Widget mordal,
    {bool isScrollControlled = true}) {
  FocusScope.of(context).requestFocus(FocusNode());
  return showModalBottomSheet(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      enableDrag: true,
      useSafeArea: true,
      isScrollControlled: isScrollControlled,
      context: context,
      builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: mordal));
}
