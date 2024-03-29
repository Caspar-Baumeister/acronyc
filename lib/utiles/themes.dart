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
    colorScheme:
        ColorScheme.fromSwatch().copyWith(background: BACKGROUND_COLOR),
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

class CustomSplashFactory extends InteractiveInkFeatureFactory {
  const CustomSplashFactory();

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    double getReducedRadius(RenderBox referenceBox) {
      final Size size = referenceBox.size;
      final double maxRadius =
          size.width > size.height ? size.width : size.height;
      return maxRadius * 0.50 * 0.75; // Reduce the radius by 50%
    }

    final double calculatedRadius = radius ?? getReducedRadius(referenceBox);
    return InkRipple(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      textDirection: textDirection,
      containedInkWell: containedInkWell,
      rectCallback: containedInkWell ? () => referenceBox.paintBounds : null,
      borderRadius:
          borderRadius ?? BorderRadius.circular(40), // Customizable radius
      customBorder: customBorder,
      radius: calculatedRadius,
      onRemoved: onRemoved,
    );
  }
}
