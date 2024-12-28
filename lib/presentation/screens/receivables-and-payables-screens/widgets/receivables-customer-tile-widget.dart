import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/main.dart';

class ReceivablesCustomerTileWidget extends StatelessWidget {
  final String leadingText;
  final String title1;
  final String subtitle1;
  final String title2;
  final String subtitle2;
  final String bottomText;
  final String trailingText;
  final bool ifShowWhatsapp;

  const ReceivablesCustomerTileWidget({
    super.key,
    required this.leadingText,
    required this.title1,
    required this.subtitle1,
    required this.title2,
    required this.subtitle2,
    required this.bottomText,
    required this.trailingText,
    required this.ifShowWhatsapp ,
  });

  @override
  Widget build(BuildContext context) {
    return 
     Column(
       children: [
         Container(
         
            padding:  EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        leadingText,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                      SizedBox(height: 14.h),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title1,
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)),
                                Text(subtitle1,
                                    style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                              ],
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title2,
                                    style: TextStyle(fontWeight: FontWeight.w600,  fontSize: 14.sp)),
                                Text(subtitle2,
                                    style: TextStyle(color: Colors.grey,  fontSize: 14.sp)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Text(bottomText,
                          style: TextStyle(color: Colors.black54, fontSize: 14.sp)),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(trailingText,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone, color: Colors.blue),
                        SizedBox(width: 8.w),
                        ifShowWhatsapp ? Image.asset('assets/images/whatsapp.png', width: 24.w): Container(),
                        SizedBox(width: 8.w),
                        Icon(Icons.picture_as_pdf, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          
             ),
             Divider(
               thickness: 1,
             ),
       ],
     );
  }
}
