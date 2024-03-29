import 'package:acronyc_app/utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenAsanaView extends StatelessWidget {
  const FullScreenAsanaView(
      {super.key,
      required this.url,
      required this.tag,
      required this.description});

  final String url;
  final String tag;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: BLACK,
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          focusColor: BLACK,
          backgroundColor: BLACK,
          foregroundColor: WHITE,
          splashColor: BLACK,
          highlightElevation: 0,
          elevation: 0,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.close,
            color: WHITE,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      backgroundColor: BLACK,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Hero(
                  tag: tag,
                  child: PhotoViewGallery(
                    // white ba
                    backgroundDecoration: const BoxDecoration(
                      color: BLACK,
                    ),
                    pageOptions: <PhotoViewGalleryPageOptions>[
                      PhotoViewGalleryPageOptions(
                        imageProvider: AssetImage(url),
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.covered * 2,
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: 200,
              //   // color: GREEN,
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Center(
              //       child:
              //           Text(description ?? "", style: STANDART_DESCRIPTION)),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
