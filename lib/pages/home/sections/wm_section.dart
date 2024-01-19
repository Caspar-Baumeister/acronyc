import 'package:flutter/material.dart';

import '../../../data/example_washing_machines.dart';
import '../../../utiles/constants.dart';
import '../widgets/grid_view_wm_card.dart';

class WmSection extends StatelessWidget {
  const WmSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: STANDART_HORIZONTAL_PADDING,
            ),
            child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.8,
                children: washingMachines
                    .map(
                      (wm) => GridViewWMCard(
                        imageUrl: wm.steps[0].image,
                        title: wm.name.toUpperCase(),
                        wmId: wm.id,
                        difficulty: wm.diffficulty,
                      ),
                    )
                    .toList()),
          )
        ],
      ),
    );
  }
}
