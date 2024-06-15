import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ImageDownloader {
  final Dio _dio = Dio();
  static final ImageDownloader _instance = ImageDownloader._internal();
  Directory? _baseDirectory;

  factory ImageDownloader() {
    return _instance;
  }

  ImageDownloader._internal();

  Future<void> init() async {
    // Get the base directory to save images
    final directory = await getApplicationDocumentsDirectory();
    _baseDirectory = Directory('${directory.path}/aconyc');

    // Create base directory if it doesn't exist
    if (!_baseDirectory!.existsSync()) {
      _baseDirectory!.createSync(recursive: true);
    }
  }

  Directory _getPoseDirectory(String poseIdentifier) {
    return Directory('${_baseDirectory!.path}/$poseIdentifier');
  }

  String getPosePath(String imageName, String poseIdentifier) {
    return '${_baseDirectory!.path}/$poseIdentifier/${imageName.split('/').last}';
  }

  Future<void> downloadImage(String imageUrl, String poseIdentifier) async {
    try {
      if (_baseDirectory == null) {
        throw Exception('Base directory is not initialized');
      }

      final poseDirectory = _getPoseDirectory(poseIdentifier);

      // Create pose directory if it doesn't exist
      if (!poseDirectory.existsSync()) {
        poseDirectory.createSync(recursive: true);
      }

      // Extract the image file name from the URL
      final fileName = imageUrl.split('/').last;
      final filePath = '${poseDirectory.path}/$fileName';

      // Download the image and save it to the device
      await _dio.download(imageUrl, filePath);

      print("image downloaded: $filePath");
    } catch (e) {
      print('Error downloading images: $e');
    }
  }

  Future<void> deletePoseImage(String poseIdentifier) async {
    try {
      if (_baseDirectory == null) {
        throw Exception('Base directory is not initialized');
      }

      final poseDirectory =
          Directory("${_baseDirectory!.path}/$poseIdentifier");

      // Check if the directory exists
      if (poseDirectory.existsSync()) {
        // Delete the directory and its contents
        poseDirectory.deleteSync(recursive: true);
        print('Pose images deleted successfully');
      } else {
        print('No pose images found to delete');
      }
    } catch (e) {
      print('Error deleting pose images: $e');
    }
  }

  bool isDownloaded(String poseIdentifier) {
    final poseDirectory = _getPoseDirectory(poseIdentifier);
    return poseDirectory.existsSync();
  }
}
