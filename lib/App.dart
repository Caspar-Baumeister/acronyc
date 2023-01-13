import 'package:acronyc_app/routing/router.dart';
import 'package:acronyc_app/utiles/themes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: MyThemes.getThemeFromKey(MyThemeKeys.LIGHT),
      routerConfig: goRouter,
    );
  }
}
