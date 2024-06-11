import 'package:acronyc_app/utiles/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {super.key,
      this.imageUrl,
      this.width,
      this.height,
      this.fit = BoxFit.cover});

  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer),
      );
    }
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
            alignment: Alignment.bottomCenter, // Align to bottom center
          ),
        ),
      ),
      placeholder: (context, url) => Container(
          width: width,
          height: height,
          color: Theme.of(context).colorScheme.primaryContainer),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Icon(
          Icons.error,
          color: Theme.of(context).colorScheme.onError,
          size: AppDimensions.iconSizeMedium,
        ),
      ),
    );
  }
}
