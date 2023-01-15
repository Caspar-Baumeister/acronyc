import 'package:acronyc_app/utiles/colors.dart';
import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: PRIMARY_COLOR),
    primaryColor: PRIMARY_COLOR,
    appBarTheme: const AppBarTheme(
      color: APPBAR_COLOR,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: NOT_ACTIVE_COLOR,
      cursorColor: PRIMARY_COLOR,
      selectionHandleColor: PRIMARY_COLOR,
    ),
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    highlightColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );

  // maybe for outdoor
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey,
    brightness: Brightness.dark,
    highlightColor: Colors.white,
    backgroundColor: Colors.black54,
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: Colors.grey),
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
