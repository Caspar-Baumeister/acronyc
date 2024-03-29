import 'package:acronyc_app/pages/home/widgets/grid_view_wm_card.dart';
import 'package:acronyc_app/services/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WmSection extends StatelessWidget {
  const WmSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, filterProvider, _) => Column(
        children: [
          GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.75,
              children: filterProvider
                  .getWm()
                  .map(
                    (wm) => GridViewWmCard(wm: wm),
                  )
                  .toList())
        ],
      ),
    );
  }
}
