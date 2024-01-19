import 'package:flutter/material.dart';

import '../../../components/buttons/standart_button.dart';
import '../../../utiles/colors.dart';
import '../../../utiles/constants.dart';
import '../../../utiles/text_styles.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Acronyc",
      //     style: MAIN_TITLE,
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                "assets/images/acronyc_expample.png",
                // height: MediaQuery.of(context).size.width,
              ),
            ),
            // const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    "Welcome to Acronyc",
                    style: SUB_TITLE,
                  )),
                  const SizedBox(height: 20),
                  const StandartTextField(hintText: "Username"),
                  const SizedBox(height: 15),
                  const StandartTextField(hintText: "Password"),
                  const SizedBox(height: 15),
                  const StandartTextField(hintText: "Password confirmation"),
                  const SizedBox(height: 20),
                  StandartButton(
                    text: "Register",
                    onPressed: () {},
                    isFilled: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StandartTextField extends StatelessWidget {
  const StandartTextField({super.key, this.hintText = ""});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: STANDART_BUTTON_WIDTH,
      height: STANDART_BUTTON_HEIGHT,
      child: TextField(
          decoration: InputDecoration(
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.0, color: ACCENT_COLOR),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.5, color: ACCENT_COLOR),
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: hintText,
              hintStyle: STANDART_DESCRIPTION,
              contentPadding: const EdgeInsets.fromLTRB(12.0, 2.0, 0.0, 10.0)),
          style: STANDART_DESCRIPTION),
    );
  }
}
