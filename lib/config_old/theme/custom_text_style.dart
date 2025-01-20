import 'package:flutter/material.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/utility/size_utils.dart';


/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Inter text style
  static get interGray500 => TextStyle(
        color: appTheme.gray500,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w700,
      ).inter;
  // Label text style
  static get labelMediumBlue800 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blue800,
      );

  static get labelLargeGray800 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.gray800,
    fontWeight: FontWeight.w500,
  );
  static get labelLargeMedium => theme.textTheme.labelLarge!.copyWith(
    fontWeight: FontWeight.w500,
  );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.whiteA700,
    fontWeight: FontWeight.w700,
  );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
