import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CalculateButton extends StatelessWidget {
final VoidCallback onPressed;

CalculateButton({required this.onPressed});
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onPressed ,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
         
        ),
        width: 160.w,
        height: 50.h,
        child: SvgPicture.asset('assets/images/calculators/calculate_button.svg'),
      ),
    );
  }
}