import 'package:acronyc_app/pages/home/widgets/filter_row_item_container.dart';
import 'package:acronyc_app/services/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetFilterButton extends StatelessWidget {
  const ResetFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<FilterProvider>(context, listen: false).clearFilters();
      },
      child: const SizedBox(
        width: 200,
        child: FilterRowItemContainer(
          isActive: false,
          child: Center(child: Text("Filter zurücksetzen")),
        ),
      ),
    );
  }
}
