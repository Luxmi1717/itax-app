import 'package:flutter/material.dart';

const num FIGMA_DESIGN_WIDTH = 360;
const num FIGMA_DESIGN_HEIGHT = 640;
const num FIGMA_DESIGN_STATUS_BAR = 0;

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

class Sizer extends StatelessWidget {
  const Sizer({super.key, required this.builder});

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

class SizeUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static double? height;
  static double? width;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      width = constraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = constraints.maxHeight.isNonZero();
    } else {
      width = constraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = constraints.maxWidth.isNonZero();
    }
    deviceType = DeviceType.mobile;
  }
}

/// Extension for responsive values
extension ResponsiveExtension on num {
  double get _width => SizeUtils.width ?? FIGMA_DESIGN_WIDTH.toDouble();
  double get _height => SizeUtils.height ?? FIGMA_DESIGN_HEIGHT.toDouble();

  double get h => ((this * _width) / FIGMA_DESIGN_WIDTH);
  double get v =>
      (this * _height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR);
  double get adaptSize => v < h ? v.toDoubleValue() : h.toDoubleValue();
  double get fSize => adaptSize;
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

enum DeviceType { mobile, tablet, desktop }
