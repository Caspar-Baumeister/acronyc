import 'package:acronyc_app/services/data_singelton.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_class.dart';
import 'services/local_storage/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorageService.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int isInitScreen = prefs.getInt("initScreen") ?? 0;

  DataSingelton().initializeData();
  runApp(AppClass(isInitScreen: isInitScreen));
}
