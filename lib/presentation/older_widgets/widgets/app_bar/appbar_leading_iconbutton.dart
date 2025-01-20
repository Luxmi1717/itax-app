
import 'package:flutter/material.dart';
import 'package:itax/utility/size_utils.dart';

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
          height: 25.adaptSize,
          width: 25.adaptSize,
          child: CustomImageView(
            imagePath: imagePath,
          ),
        ),
      ),
    );
  }
}
