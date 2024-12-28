import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpAndSupportSliderWidget extends StatelessWidget {
  const HelpAndSupportSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            // Row 1: Title
            Row(
              children: [
                Image.asset('assets/images/whatsapp.png'),
                SizedBox(width: 6.w),
                Text(
                  'WhatsApp Support',
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
      
            // Row 2: Tiles
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.phone, color: Colors.blue),
                                SizedBox(width: 6.w),

                              
      
                Text('Call for Support', style: TextStyle( fontSize: 20.sp)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}