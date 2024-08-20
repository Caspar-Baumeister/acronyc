import 'package:acronyc_app/pages/home/widgets/filter_row_item_container.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/text_styles.dart';
import 'package:flutter/material.dart';

class FilterRowBinaryItem extends StatelessWidget {
  const FilterRowBinaryItem(
      {super.key,
      required this.title,
      required this.changeActiveFilter,
      required this.isActive});

  final String title;
  final Function(bool) changeActiveFilter;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeActiveFilter(!isActive);
      },
      child: FilterRowItemContainer(
        isActive: isActive,
        child: Row(
          children: [
            Text(
              title,
              style:
                  FILTER_TITLE.copyWith(color: isActive ? WHITE : TEXT_COLOR),
            ),
          ],
        ),
      ),
    );
  }
}
