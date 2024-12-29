import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownloadOptionsSlider extends StatelessWidget {

  const DownloadOptionsSlider({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              // Handle tap
            },
            child: Row(
              children: [
              Image.asset('assets/images/pdf-image-black.png', width: 24.w, height: 24.h),
              SizedBox(width: 8.w),
              Text('Download Invoice(PDF)', style: TextStyle(color: Colors.black, fontSize: 18.sp)),
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
              Image.asset('assets/images/excel-logo.png', width: 24.w, height: 24.h),
              SizedBox(width: 8.w),
              Text('Download Invoice(Excel)', style: TextStyle(color: Colors.black, fontSize: 18.sp)),
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
              Image.asset('assets/images/csv-logo.png', width: 24.w, height: 24.h),
              SizedBox(width: 8.w),
              Text('Download Invoice(CSV)', style: TextStyle(color: Colors.black, fontSize: 18.sp)),
              ],
            ),)
        ]));
    
  }
}