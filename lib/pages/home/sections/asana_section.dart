import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/providers/filter_provider.dart';
import '../widgets/grid_view_asana_card.dart';

class AsanaSection extends StatelessWidget {
  const AsanaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, asanaSearchProvider, _) => GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.8,
          children: asanaSearchProvider
              .getAsanas()
              .map(
                (asana) => GridViewAsanaCard(
                  asana: asana,
                ),
              )
              .toList()),
    );
  }
}
