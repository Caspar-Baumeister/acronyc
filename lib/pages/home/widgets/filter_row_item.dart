import 'package:acronyc_app/pages/home/widgets/filter_row_item_container.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:acronyc_app/utiles/text_styles.dart';
import 'package:flutter/material.dart';

class FilterRowItem extends StatelessWidget {
  const FilterRowItem(
      {super.key,
      required this.eraseFilterOptionText,
      required this.hintText,
      this.activeFilter,
      required this.filterList,
      required this.changeActiveFilter});

  final String? activeFilter;
  final List<String> filterList;
  final Function(String?) changeActiveFilter;
  final String eraseFilterOptionText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return FilterRowItemContainer(
      isActive: activeFilter != null && activeFilter != eraseFilterOptionText,
      child: DropdownButton<String>(
          underline: Container(),
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
          value: activeFilter,
          // hint: Text(
          //   hintText,
          //   style: FILTER_TITLE,
          // ),

          onChanged: _handleDropdownChanged,
          icon: _buildDropdownIcon(),
          selectedItemBuilder: _buildSelectedItem,
          items: _buildDropdownItems()),
    );
  }

  void _handleDropdownChanged(String? newValue) {
    changeActiveFilter(newValue == eraseFilterOptionText ? null : newValue);
  }

  Icon _buildDropdownIcon() {
    return Icon(
      Icons.arrow_drop_down,
      color: activeFilter != null && activeFilter != eraseFilterOptionText
          ? WHITE
          : TEXT_COLOR,
    );
  }

  List<Widget> _buildSelectedItem(BuildContext context) {
    return [eraseFilterOptionText, ...filterList]
        .map<Widget>(
          (String value) => Container(
            padding: const EdgeInsets.only(
                top:
                    FILTER_ROW_ALIGNMENT_PROPERTY), // Adjust the top padding here
            child: Text(
              value == eraseFilterOptionText ? hintText : value,
              style: FILTER_TITLE.copyWith(
                color: activeFilter != null &&
                        activeFilter != eraseFilterOptionText
                    ? WHITE
                    : TEXT_COLOR,
              ),
            ),
          ),
        )
        .toList();
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    return [eraseFilterOptionText, ...filterList]
        .map<DropdownMenuItem<String>>(
          (String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: FILTER_TITLE),
          ),
        )
        .toList();
  }
}
