import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ClearButton extends StatelessWidget {
  final VoidCallback onPressed;
  ClearButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
      ),
      width: 160.w,
            height: 48.h,

      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(14.r),
        child: SvgPicture.asset('assets/images/calculators/clear_button.svg', fit: BoxFit.cover,
        ),
      ),
    );
  }
}
