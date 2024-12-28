import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankTile extends StatelessWidget {
  final String leadingText1;
  final String leadingText2;
  final String leadingText3;
  final String leadingContainerText;
  final String trailingText;
  final Color trailingTextColor;

  const BankTile({
    super.key,
    required this.leadingText1,
    required this.leadingText2,
    required this.leadingText3,
    required this.leadingContainerText,
    required this.trailingText,
    required this.trailingTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    leadingText1,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      leadingContainerText,
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Text(
                leadingText2,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 4.0),
              Text(
                leadingText3,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                trailingText,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: trailingTextColor,
                    fontWeight: FontWeight.w600),
              ),
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
