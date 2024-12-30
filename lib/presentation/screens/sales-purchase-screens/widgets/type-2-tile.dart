import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileTypeTwo extends StatelessWidget {
  final String leadingText;
  final String subText;
  final String trailingText;
  final void Function()? onTap;

  const TileTypeTwo({
    super.key,
    required this.leadingText,
    required this.subText,
    required this.trailingText, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            contentPadding:
                 EdgeInsets.symmetric(horizontal: 16.0.w, ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  leadingText,
                  style:  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4.0),
                Text(
                  subText,
                  style:  TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ],
            ),
            trailing: Text(
              trailingText,
              style:  TextStyle(fontSize: 18.sp, color: Colors.black),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
