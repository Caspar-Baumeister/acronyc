import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/providers/filter_provider.dart';
import '../../../utiles/colors.dart';
import '../../../utiles/constants.dart';
import '../../../utiles/enums.dart';
import '../../../utiles/text_styles.dart';

class FilterRowSection extends StatelessWidget {
  const FilterRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    FilterProvider asanaSearchProvider = Provider.of<FilterProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: STANDART_HORIZONTAL_PADDING),
          FilterRowBinaryItem(
            title: "Markiert",
            isActive: asanaSearchProvider.isMarkedFilter,
            changeActiveFilter: (_) {
              asanaSearchProvider.toggleMarked();
            },
          ),
          const SizedBox(width: 10),
          // TODO offen, geschafft auswählen
          FilterRowBinaryItem(
            title: "Offen",
            isActive: asanaSearchProvider.isNotDoneFilter,
            changeActiveFilter: (_) {
              asanaSearchProvider.toggleNotDone();
            },
          ),
          const SizedBox(width: 10),
          FilterRowItem(
            hintText: "Schwierigkeit",
            eraseFilterOptionText: Difficulty.all.name,
            filterList: [
              Difficulty.easy.name,
              Difficulty.medium.name,
              Difficulty.hard.name
            ],
            changeActiveFilter: (String? filter) {
              if (filter == null) {
                asanaSearchProvider.setDifficulty(Difficulty.all);
              } else {
                asanaSearchProvider.setDifficulty(
                  DifficultyExtension.fromName(filter),
                );
              }
              return null;
            },
          ),
          const SizedBox(width: 10),
          FilterRowBinaryItem(
            title: "Herruntergeladen",
            isActive: asanaSearchProvider.isMarkedFilter,
            changeActiveFilter: (_) {
              asanaSearchProvider.toggleMarked();
            },
          ),
          // const SizedBox(width: 10),
          // FilterRowItem(
          //   hintText: "Akrobatik Art",
          //   eraseFilterOptionText: AcrobaticsType.both.name,
          //   filterList: [
          //     AcrobaticsType.l_basing.name,
          //     AcrobaticsType.standing.name
          //   ],
          //   changeActiveFilter: (String? filter) {
          //     return null;
          //   },
          // ),
          const SizedBox(width: STANDART_HORIZONTAL_PADDING),
        ],
      ),
    );
  }
}

class FilterRowItem extends StatefulWidget {
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
  State<FilterRowItem> createState() => _FilterRowItemState();
}

class _FilterRowItemState extends State<FilterRowItem> {
  late String? activeFilter;

  @override
  void initState() {
    super.initState();
    activeFilter = widget.activeFilter;
  }

  @override
  Widget build(BuildContext context) {
    return FilterRowItemContainer(
      isActive: activeFilter != null,
      child: DropdownButton<String>(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
          value: activeFilter,
          hint: Text(
            widget.hintText,
            style: FILTER_TITLE,
          ),
          onChanged: _handleDropdownChanged,
          icon: _buildDropdownIcon(),
          selectedItemBuilder: _buildSelectedItem,
          items: _buildDropdownItems()),
    );
  }

  void _handleDropdownChanged(String? newValue) {
    setState(() {
      activeFilter = newValue == widget.eraseFilterOptionText ? null : newValue;
    });
    widget.changeActiveFilter(activeFilter);
  }

  Icon _buildDropdownIcon() {
    return Icon(
      Icons.arrow_drop_down,
      color: activeFilter != null ? WHITE : TEXT_COLOR,
    );
  }

  List<Widget> _buildSelectedItem(BuildContext context) {
    return [widget.eraseFilterOptionText, ...widget.filterList]
        .map<Widget>(
          (String value) => Container(
            padding: const EdgeInsets.only(
                top:
                    FILTER_ROW_ALIGNMENT_PROPERTY), // Adjust the top padding here
            child: Text(
              value,
              style: FILTER_TITLE.copyWith(
                color: activeFilter != null ? WHITE : TEXT_COLOR,
              ),
            ),
          ),
        )
        .toList();
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    return [widget.eraseFilterOptionText, ...widget.filterList]
        .map<DropdownMenuItem<String>>(
          (String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: FILTER_TITLE),
          ),
        )
        .toList();
  }
}

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

class FilterRowItemContainer extends StatelessWidget {
  const FilterRowItemContainer(
      {super.key, required this.child, required this.isActive});

  final Widget child;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: const BoxConstraints(maxHeight: FILTER_HEIGHT),
      height: FILTER_HEIGHT,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(STANDART_BUTTON_ROUNDNESS),
        color: isActive ? ACCENT_COLOR : COMPONENT_BACKGROUND_COLOR,
        border: Border.all(color: TEXT_COLOR),
      ),
      child: child,
    );
  }
}
