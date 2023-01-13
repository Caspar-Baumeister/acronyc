import 'package:acronyc_app/components/buttons/standart_button.dart';
import 'package:acronyc_app/layouts/main_body_padding.dart';
import 'package:acronyc_app/layouts/standart_text_column.dart';
import 'package:acronyc_app/utiles/text_styles.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = (MediaQuery.of(context).size.width / 2) - 30;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Acronyc",
          style: MAIN_TITLE,
        ),
      ),
      body: MainBodyPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: StandartTextColumn(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  "A comprehensive and beautiful guide to AcroYoga.",
                  "Get started today and become a master base or flyer!"
                ],
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                "assets/images/acronyc_expample.png",
                // height: MediaQuery.of(context).size.width,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StandartButton(
                    text: "Register",
                    onPressed: () {},
                    width: buttonWidth,
                    isFilled: true,
                  ),
                  StandartButton(
                      text: "Login", onPressed: () {}, width: buttonWidth)
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Center(
                child: Text(
              "Continue without  Login",
              style: STANDART_DESCRIPTION,
            ))
          ],
        ),
      ),
    );
  }
}