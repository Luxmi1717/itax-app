import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPartiesTile extends StatelessWidget {
  final String leadingText;
  final String trailingText;
  final void Function()? onTap;

  const CustomPartiesTile({
    super.key,
    required this.leadingText,
    required this.trailingText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            leading: CircleAvatar(
              child: Center(child: Text(leadingText.substring(0, 1), style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),)),
              radius: 18.r,
              backgroundColor: Colors.grey[200],
            ),
            title: Text(
              leadingText,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            trailing: Text(
              trailingText,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
