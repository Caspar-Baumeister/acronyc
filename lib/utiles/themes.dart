import 'package:acronyc_app/utiles/custom_splash_factory.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

// ignore: constant_identifier_names
enum MyThemeKeys { LIGHT, DARK }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    chipTheme: ChipThemeData(
      backgroundColor: BACKGROUND_COLOR,
      selectedColor: ACCENT_COLOR,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      elevation: 6,
      shadowColor: Colors.grey[60],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      labelStyle: H14W5,
      labelPadding: const EdgeInsets.all(2),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: BACKGROUND_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      surfaceTintColor: BACKGROUND_COLOR,
    ),
    scaffoldBackgroundColor: BACKGROUND_COLOR,
    splashFactory: const CustomSplashFactory(),
    splashColor: ACCENT_COLOR,
    highlightColor: ACCENT_COLOR.withOpacity(0.5),
    dialogTheme: const DialogTheme(
        backgroundColor: BACKGROUND_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        surfaceTintColor: BACKGROUND_COLOR),
    tabBarTheme: TabBarTheme(
      // ... other TabBarTheme properties ...
      overlayColor: MaterialStateProperty.all(
          ACCENT_COLOR.withOpacity(0.3)), // Customize the opacity as needed
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: ACCENT_COLOR),
    primaryColor: ACCENT_COLOR,
    appBarTheme: const AppBarTheme(
        color: BACKGROUND_COLOR, surfaceTintColor: BACKGROUND_COLOR),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: NOT_ACTIVE_COLOR,
      cursorColor: ACCENT_COLOR,
      selectionHandleColor: ACCENT_COLOR,
    ),
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
        primary: ACCENT_COLOR,
        secondary: ACCENT_COLOR,
        background: BACKGROUND_COLOR,
        primaryContainer: BACKGROUND_COLOR),
  );

  // maybe for outdoor
  static final ThemeData darkTheme = ThemeData();

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
