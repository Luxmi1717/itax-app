import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceivablesAgeingTileWidget extends StatelessWidget {
  final String topLeftText;
  final String topRightText;
  final List<Map<String, String>>
      titleSubtitleList; // List of titles and subtitles
  final String bottomText;

  const ReceivablesAgeingTileWidget({
    Key? key,
    required this.topLeftText,
    required this.topRightText,
    required this.titleSubtitleList,
    required this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
           
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row 1: Top Texts with Spacer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    topLeftText,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                  Spacer(),
                  Text(
                    topRightText,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ],
              ),
              SizedBox(height: 14.h),

              // Row 2: Titles and Subtitles
              Row(
                children: titleSubtitleList.map((item) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'] ?? '',
                            style: TextStyle(
                                 fontSize: 14.sp),
                          ),
                          Text(
                            item['subtitle'] ?? '',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 15.h),

              // Row 3: Bottom Text
              Text(
                bottomText,
                style: TextStyle(color: Colors.black54, fontSize: 14.sp),
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
