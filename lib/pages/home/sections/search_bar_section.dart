import 'package:flutter/material.dart';

import '../../../utiles/colors.dart';
import '../../../utiles/constants.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    required this.text,
    required this.onChanged,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  @override
  SearchBarWidgetState createState() => SearchBarWidgetState();
}

class SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController controller;
  late String searchText;

  @override
  void initState() {
    controller = TextEditingController(text: widget.text);
    searchText = widget.text;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SEARCHBAR_HEIGHT,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(STANDART_BUTTON_ROUNDNESS),
        color: COMPONENT_BACKGROUND_COLOR,
        border: Border.all(color: TEXT_COLOR),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        autofocus: false,
        textInputAction: TextInputAction.search,

        controller: controller,
        cursorHeight: 15.0, // Adjust this value as needed

        decoration: InputDecoration(
          icon: const Icon(
            Icons.search,
            color: TEXT_COLOR,
            size: STANDART_ICON_SIZE,
          ),
          suffixIcon: widget.text != ""
              ? GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: TEXT_COLOR,
                  ),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                  },
                )
              : null,

          hintText: widget.hintText,
          hintStyle: const TextStyle(color: TEXT_COLOR_LIGHT),
          border: InputBorder.none,

          // Adjust content padding here
          contentPadding: const EdgeInsets.symmetric(
              vertical: (SEARCHBAR_HEIGHT - STANDART_ICON_SIZE) / 2),
        ),
        style: const TextStyle(color: TEXT_COLOR),
        onChanged: (query) {
          setState(() {
            searchText = query;
          });
          widget.onChanged(query);
        },
      ),
    );
  }
}
