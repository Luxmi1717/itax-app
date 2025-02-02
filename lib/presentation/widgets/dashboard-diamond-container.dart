import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';

class DashboardDiamondContainer extends StatelessWidget {
  final String text;

  const DashboardDiamondContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/dimond.svg',
          height: 32.h,
          width: 30.w,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            
            color: mainBlueColor,
          ),
        ),
      ],
    );
  }
}