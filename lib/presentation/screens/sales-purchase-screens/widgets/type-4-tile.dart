import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileTypeFour extends StatelessWidget {
  final String leadingText1;
  final String leadingText2;
  
  final String trailingText;
  final bool ifLeadingContainer;
  final bool ifGreen;
  final String trailingContainerContent;

  const TileTypeFour({
    super.key,
    required this.leadingText1,
    required this.leadingText2,
    required this.trailingText,
    required this.ifLeadingContainer,
    required this.trailingContainerContent,
    required this.ifGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
               EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.h),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    leadingText1,
                    style:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 8.w),
                   ifLeadingContainer
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: ifGreen
                                ? Colors.green.withOpacity(0.1)
                                : const Color.fromARGB(255, 210, 210, 210),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            trailingContainerContent,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: ifGreen ? Colors.green : const Color.fromARGB(255, 99, 99, 99)),

                          ),
                        )
                      : Container(),
                ],
              ),
             
               SizedBox(height: 8.h),
              Text(
                leadingText2,
                style:  TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
            ],
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                trailingText,
                style:  TextStyle(fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8.0),
             
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
