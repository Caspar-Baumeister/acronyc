import 'package:flutter/material.dart';

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
