import 'package:acronyc_app/utiles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GridViewAsanaCard extends StatelessWidget {
  const GridViewAsanaCard(
      {super.key, required this.title, required this.imageUrl});

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go("/asana"),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imageUrl,
              // height: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: STANDART_DESCRIPTION,
                  ),
                  Image.asset(
                    "assets/icons/Press_area.png",
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
