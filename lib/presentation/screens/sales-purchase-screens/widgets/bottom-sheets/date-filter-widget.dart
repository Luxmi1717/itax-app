import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateOptionsSlider extends StatelessWidget {
  const DateOptionsSlider({
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
                Text('Select Date',
                    style: TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold)),
                Spacer(),
                Text('Reset',
                    style: TextStyle(color: Colors.blue, fontSize: 18.sp)),
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
                Text('Today',
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
                Text('Financial Year (1 Apr 24 to 31 Mar 25)',
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
                Text('Last Financial Year (1 Apr\'23 to\n 31Mar 24)',
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
                Text('This Month',
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
                Text('Last Month',
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
                Text('Custom',
                    style: TextStyle(color: Colors.black, fontSize: 18.sp)),
              ],
            ),
          )
        ]));
  }
}
