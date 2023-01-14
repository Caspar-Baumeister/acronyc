import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/constants.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    required this.text,
    required this.onChanged,
    required this.onSubmit,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  final String text;
  final ValueChanged<String> onChanged;
  final Function onSubmit;
  final String hintText;

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late final controller;
  late String searchText;

  @override
  void initState() {
    controller = TextEditingController(text: widget.text);
    searchText = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: STANDART_BUTTON_HEIGHT,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(STANDART_BUTTON_ROUNDNESS),
        color: Colors.white,
        border: Border.all(color: PRIMARY_COLOR),
      ),
      // internal padding
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        autofocus: true,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) => widget.onSubmit(searchText),
        controller: controller,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.search,
            color: PRIMARY_COLOR,
            size: STANDART_ICON_SIZE,
          ),
          suffixIcon: widget.text != ""
              ? GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: PRIMARY_COLOR,
                  ),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: NOT_ACTIVE_COLOR),
          border: InputBorder.none,
        ),
        style: const TextStyle(color: PRIMARY_COLOR),
        onChanged: (query) => setState(() {
          searchText = query;
        }),
      ),
    );
  }
}
