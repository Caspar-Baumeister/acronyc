import 'package:acronyc_app/components/search_bar_widget.dart';
import 'package:acronyc_app/layouts/main_body_padding.dart';
import 'package:acronyc_app/pages/asana_search_page/widgets/grid_view_asana_card.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:acronyc_app/utiles/text_styles.dart';
import 'package:flutter/material.dart';

class AsanaSearchPage extends StatelessWidget {
  const AsanaSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = (MediaQuery.of(context).size.width / 2) - 30;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.menu),
            SizedBox(width: 10),
            Text(
              "Asanas",
              style: MAIN_TITLE,
            ),
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: MainBodyPadding(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchBarWidget(
                        text: "",
                        onChanged: (value) {},
                        onSubmit: () {},
                        hintText: "Search for Asanas",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: STANDART_BUTTON_HEIGHT,
                      height: STANDART_BUTTON_HEIGHT,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(STANDART_BUTTON_ROUNDNESS),
                        color: Colors.white,
                        border: Border.all(color: PRIMARY_COLOR),
                      ),
                      child: const Icon(
                        Icons.filter_alt_outlined,
                        color: PRIMARY_COLOR,
                        size: STANDART_ICON_SIZE,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8,
                  children: const [
                    GridViewAsanaCard(
                      imageUrl: "assets/images/acronyc_image_example.png",
                      title: "Bird",
                    ),
                    GridViewAsanaCard(
                      imageUrl: "assets/images/acronyc_image_example.png",
                      title: "Bird",
                    ),
                    GridViewAsanaCard(
                      imageUrl: "assets/images/acronyc_image_example.png",
                      title: "Bird",
                    ),
                    GridViewAsanaCard(
                      imageUrl: "assets/images/acronyc_image_example.png",
                      title: "Bird",
                    ),
                    GridViewAsanaCard(
                      imageUrl: "assets/images/acronyc_image_example.png",
                      title: "Bird",
                    ),
                    GridViewAsanaCard(
                      imageUrl: "assets/images/acronyc_image_example.png",
                      title: "Bird",
                    ),
                    GridViewAsanaCard(
                      imageUrl: "assets/images/acronyc_image_example.png",
                      title: "Bird",
                    ),
                    GridViewAsanaCard(
                      imageUrl: "assets/images/acronyc_image_example.png",
                      title: "Bird",
                    ),
                    GridViewAsanaCard(
                      imageUrl: "assets/images/acronyc_image_example.png",
                      title: "Bird",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
