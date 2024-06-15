// search_view_model.dart
import 'package:acronyc_app/models/asana_model.dart';
import 'package:acronyc_app/services/data_singelton.dart';
import 'package:acronyc_app/services/download_services/image_downloader.dart';
import 'package:acronyc_app/services/local_storage/local_storage_service.dart';
import 'package:acronyc_app/utiles/enums.dart';
import 'package:flutter/material.dart';

class UserInputProvider extends ChangeNotifier {
  List<String> marketAsanas = [];
  List<String> completedAsanas = [];
  List<String> markedWashingMachines = [];
  List<String> completedWashingMachines = [];
  List<String> markedTransitions = [];
  List<String> completedTransitions = [];
  List<String> downloadedWashingMachines = [];
  List<String> downloadedAsanas = [];
  List<String> downloadedTransitions = [];

  ImageDownloader imageDownloader = ImageDownloader();

  UserInputProvider() {
    initialize();
  }

  void initialize() {
    marketAsanas = LocalStorageService.get(Preferences.markedAsanas) ?? [];
    completedAsanas =
        LocalStorageService.get(Preferences.completedAsanas) ?? [];
    markedWashingMachines =
        LocalStorageService.get(Preferences.markedWashingMachines) ?? [];
    completedWashingMachines =
        LocalStorageService.get(Preferences.completedWashingMachines) ?? [];
    markedTransitions =
        LocalStorageService.get(Preferences.markedTransitions) ?? [];
    completedTransitions =
        LocalStorageService.get(Preferences.completedTransitions) ?? [];
    downloadedWashingMachines =
        LocalStorageService.get(Preferences.downloadedWashingMachines) ?? [];
    downloadedAsanas =
        LocalStorageService.get(Preferences.downloadedAsanas) ?? [];
    downloadedTransitions =
        LocalStorageService.get(Preferences.downloadedTransitions) ?? [];
  }

  void toggleMarked(String asanaId) {
    if (marketAsanas.contains(asanaId)) {
      marketAsanas.remove(asanaId);
    } else {
      marketAsanas.add(asanaId);
    }
    LocalStorageService.set(Preferences.markedAsanas, marketAsanas);
    notifyListeners();
  }

  void toggleCompleted(String asanaId) {
    if (completedAsanas.contains(asanaId)) {
      completedAsanas.remove(asanaId);
    } else {
      completedAsanas.add(asanaId);
    }
    LocalStorageService.set(Preferences.completedAsanas, completedAsanas);
    notifyListeners();
  }

  void toggleMarkedWashingMachine(String washingMachineId) {
    if (markedWashingMachines.contains(washingMachineId)) {
      markedWashingMachines.remove(washingMachineId);
    } else {
      markedWashingMachines.add(washingMachineId);
    }
    LocalStorageService.set(
        Preferences.markedWashingMachines, markedWashingMachines);
    notifyListeners();
  }

  void toggleCompletedWashingMachine(String washingMachineId) {
    if (completedWashingMachines.contains(washingMachineId)) {
      completedWashingMachines.remove(washingMachineId);
    } else {
      completedWashingMachines.add(washingMachineId);
    }
    LocalStorageService.set(
        Preferences.completedWashingMachines, completedWashingMachines);
    notifyListeners();
  }

  void toggleMarkedTransition(String transitionId) {
    if (markedTransitions.contains(transitionId)) {
      markedTransitions.remove(transitionId);
    } else {
      markedTransitions.add(transitionId);
    }
    LocalStorageService.set(Preferences.markedTransitions, markedTransitions);
    notifyListeners();
  }

  void toggleCompletedTransition(String transitionId) {
    if (completedTransitions.contains(transitionId)) {
      completedTransitions.remove(transitionId);
    } else {
      completedTransitions.add(transitionId);
    }
    LocalStorageService.set(
        Preferences.completedTransitions, completedTransitions);
    notifyListeners();
  }

  Future<void> toggleDownloadedWashingMachine(String washingMachineId) async {
    List<String> urls = DataSingelton()
        .getWashingMachineFromName(washingMachineId)
        .steps
        .map((e) => e.image)
        .toList();
    if (downloadedWashingMachines.contains(washingMachineId)) {
      downloadedWashingMachines.remove(washingMachineId);
      // remove all step images

      await imageDownloader.deletePoseImage(washingMachineId);
    } else {
      // download all step images

      await downloadImages(urls, washingMachineId, imageDownloader);

      downloadedWashingMachines.add(washingMachineId);
    }
    LocalStorageService.set(
        Preferences.downloadedWashingMachines, downloadedWashingMachines);
    notifyListeners();
  }

  Future<void> toggleDownloadedAsana(String asanaName) async {
    AsanaModel asana = DataSingelton().getAsanaFromName(asanaName);
    List<String> urls = asana.steps.map((e) => e.image).toList();

    urls.add(asana.image);
    if (downloadedAsanas.contains(asanaName)) {
      await imageDownloader.deletePoseImage(asanaName);
      downloadedAsanas.remove(asanaName);
    } else {
      await downloadImages(urls, asanaName, imageDownloader);
      downloadedAsanas.add(asanaName);
    }
    LocalStorageService.set(Preferences.downloadedAsanas, downloadedAsanas);
    notifyListeners();
  }

  Future<void> toggleDownloadedTransition(String transitionId) async {
    List<String> urls = DataSingelton()
        .getTransitionFromId(transitionId)
        .steps
        .map((e) => e.image)
        .toList();
    if (downloadedTransitions.contains(transitionId)) {
      downloadedTransitions.remove(transitionId);
      await imageDownloader.deletePoseImage(transitionId);
    } else {
      downloadedTransitions.add(transitionId);
      await downloadImages(urls, transitionId, imageDownloader);
    }
    LocalStorageService.set(
        Preferences.downloadedTransitions, downloadedTransitions);
    notifyListeners();
  }

  bool isAsanaMarked(String asanaId) {
    return marketAsanas.contains(asanaId);
  }

  bool isAsanaCompleted(String asanaId) {
    return completedAsanas.contains(asanaId);
  }

  bool isWashingMachineMarked(String washingMachineId) {
    return markedWashingMachines.contains(washingMachineId);
  }

  bool isWashingMachineCompleted(String washingMachineId) {
    return completedWashingMachines.contains(washingMachineId);
  }

  bool isTransitionMarked(String transitionId) {
    return markedTransitions.contains(transitionId);
  }

  bool isTransitionCompleted(String transitionId) {
    return completedTransitions.contains(transitionId);
  }

  bool isWashingMachineDownloaded(String washingMachineId) {
    return downloadedWashingMachines.contains(washingMachineId);
  }

  bool isAsanaDownloaded(String asanaId) {
    return downloadedAsanas.contains(asanaId);
  }

  bool isTransitionDownloaded(String transitionId) {
    return downloadedTransitions.contains(transitionId);
  }

  Future<void> downloadImages(List<String> urls, String folderName,
      ImageDownloader imageDownloader) async {
    for (String url in urls) {
      await imageDownloader.downloadImage(url, folderName);
    }
  }
}
