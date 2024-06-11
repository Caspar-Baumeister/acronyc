import 'package:acronyc_app/models/step_model.dart';
import 'package:acronyc_app/utiles/colors.dart';
import 'package:acronyc_app/utiles/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImageView extends StatefulWidget {
  const FullScreenImageView({
    super.key,
    required this.steps,
    required this.initialIndex,
    required this.changeIndex,
  });

  final List<StepModel> steps;
  final int initialIndex;
  final Function changeIndex;

  @override
  State<FullScreenImageView> createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<FullScreenImageView> {
  late int index;

  @override
  void initState() {
    index = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floating close button on top right

      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: BACKGROUND_COLOR,
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          focusColor: BACKGROUND_COLOR,
          backgroundColor: BACKGROUND_COLOR,
          splashColor: BACKGROUND_COLOR,
          highlightElevation: 0,
          elevation: 0,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.close,
            color: TEXT_COLOR,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        // swipe to change image
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            if (index > 0) {
              setState(() {
                index--;
              });
              widget.changeIndex(index);
            }
          } else {
            if (index < widget.steps.length - 1) {
              setState(() {
                index++;
              });
              widget.changeIndex(index);
            }
          }
        },
        child: Stack(
          children: [
            Hero(
              tag: widget.steps[index].image,
              child: PhotoViewGallery(
                // white ba
                backgroundDecoration: const BoxDecoration(
                  color: WHITE,
                ),
                pageOptions: <PhotoViewGalleryPageOptions>[
                  PhotoViewGalleryPageOptions(
                    imageProvider:
                        CachedNetworkImageProvider(widget.steps[index].image),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    filterQuality: FilterQuality.high,
                  ),
                ],
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 10,
              child: SafeArea(
                child: Container(
                  // color: GREEN,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                      child: Text(widget.steps[index].description ?? "",
                          style: STANDART_DESCRIPTION)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
