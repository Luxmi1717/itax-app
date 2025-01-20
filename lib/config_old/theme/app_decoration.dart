import 'package:flutter/material.dart';
import 'package:itax/config_old/theme/theme_helper.dart';
import 'package:itax/utility/size_utils.dart';



class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray40019,
  );
  static BoxDecoration get fillGray200 => BoxDecoration(
    color: appTheme.gray200,
  );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
    color: theme.colorScheme.onPrimary.withOpacity(1),
  );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
    color: theme.colorScheme.onPrimary,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(
          0,
          0,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
    color: appTheme.gray50,
  );
  static BoxDecoration get outlineBlack9001 => BoxDecoration(
    color: theme.colorScheme.onPrimary.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(
          0,
          0,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlack9002 => BoxDecoration(
    color: theme.colorScheme.onPrimary.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(
          0,
          0,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineLightBlueAAf => BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: appTheme.lightBlueA700Af,
      width: 1.h,
      strokeAlign: strokeAlignOutside,
    ),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(
          0,
          2,
        ),
      ),
    ],
  );

  static BoxDecoration get gradientBlueToBlueAf => BoxDecoration(
    gradient: LinearGradient(
      begin: const Alignment(0.07, 0.15),
      end: const Alignment(1.2, 1),
      colors: [
        appTheme.blue800.withOpacity(0.1),
        appTheme.blue800Af.withOpacity(0.1),
      ],
    ),
  );

}

class BorderRadiusStyle {

  static BorderRadius get customBorderTL30 => BorderRadius.vertical(
    top: Radius.circular(30.h),
  );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
    12.h,
  );
  static BorderRadius get roundedBorder30 => BorderRadius.circular(
    30.h,
  );
  static BorderRadius get roundedBorder6 => BorderRadius.circular(
    6.h,
  );


  // Rounded borders
  static BorderRadius get roundedBorder8 => BorderRadius.circular(8.h,);
}


// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
