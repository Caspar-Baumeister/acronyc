import 'package:acronyc_app/pages/home/widgets/grid_view_wm_card.dart';
import 'package:flutter/material.dart';

import '../../components/custom_app_bar.dart';
import '../../data/example_washing_machines.dart';
import '../../utiles/constants.dart';

class WMSearchPage extends StatelessWidget {
  const WMSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MenuDrawer(),
      appBar: const CustomAppBar(title: "Washing Machines"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: STANDART_HORIZONTAL_PADDING),
              child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8,
                  children: exampleWm
                      .map(
                        (wm) => GridViewWmCard(
                          wm: wm,
                        ),
                      )
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}
