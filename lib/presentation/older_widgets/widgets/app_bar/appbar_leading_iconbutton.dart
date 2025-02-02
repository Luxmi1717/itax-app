
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_icon_button.dart';
import '../custom_image_view.dart';


class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton({
    super.key,
    this.imagePath,
    this.margin,
    this.onTap,
  });

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 12.h,
          width: 12.w,
          child: CustomImageView(
            imagePath: imagePath,
          ),
        ),
      ),
    );
  }
}
