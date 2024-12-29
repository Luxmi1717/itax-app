import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortByOptionsSlider extends StatelessWidget {
  const SortByOptionsSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 24.h),
          InkWell(
            onTap: () {
              // Handle tap
            },
            child: Row(
              children: [
               
                SizedBox(width: 8.w),
                Text('Sort by',
                    style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text('Reset', style: TextStyle(color: Colors.blue, fontSize: 18.sp)),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          InkWell(
            onTap: () {
              // Handle tap
            },
            child: Row(
              children: [
                
                SizedBox(width: 8.w),
                Text('Amount (High to Low)',
                    style: TextStyle(color: Colors.black, fontSize: 18.sp)),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          InkWell(
            onTap: () {
              // Handle tap
            },
            child: Row(
              children: [
                
                SizedBox(width: 8.w),
                Text('Amount (Low-High)',
                    style: TextStyle(color: Colors.black, fontSize: 18.sp)),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          InkWell(
            onTap: () {
              // Handle tap
            },
            child: Row(
              children: [
               
                SizedBox(width: 8.w),
                Text('By Name (Z-A)',
                    style: TextStyle(color: Colors.black, fontSize: 18.sp)),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          InkWell(
            onTap: () {
              // Handle tap
            },
            child: Row(
              children: [
                
                SizedBox(width: 8.w),
                Text('By Name (A-Z)',
                    style: TextStyle(color: Colors.black, fontSize: 18.sp)),
              ],
            ),
          )
        ]));
  }
}
