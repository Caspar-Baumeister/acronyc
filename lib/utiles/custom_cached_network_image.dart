import 'dart:io';

import 'package:acronyc_app/services/download_services/image_downloader.dart';
import 'package:acronyc_app/services/providers/filter_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Text("Nicht herruntergeladen",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class CustomImageWrapper extends StatelessWidget {
  const CustomImageWrapper({
    super.key,
    required this.imageUrl,
    required this.poseIdentifier,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final String poseIdentifier;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    FilterProvider filterProvider = Provider.of<FilterProvider>(context);
    if (filterProvider.isDownloadedFilter) {
      return CustomDownloadedFileImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: fit,
          poseIdentifier: poseIdentifier);
    }
    return CustomCachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
    );
  }
}

class CustomDownloadedFileImage extends StatefulWidget {
  const CustomDownloadedFileImage(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      required this.poseIdentifier});

  final String imageUrl;
  final String poseIdentifier;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  State<CustomDownloadedFileImage> createState() =>
      _CustomDownloadedFileImageState();
}

class _CustomDownloadedFileImageState extends State<CustomDownloadedFileImage> {
  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(
        ImageDownloader().getPosePath(widget.imageUrl, widget.poseIdentifier),
      ),
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
    );
  }
}
