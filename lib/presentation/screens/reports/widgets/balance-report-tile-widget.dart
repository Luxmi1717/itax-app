import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportTile extends StatelessWidget {
  final String leadingText;
  final String trailingText;
  final void Function()? onTap;

  const ReportTile({
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
            title: Row(
              children: [
                Text(
                  leadingText,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 10),
                Icon(Icons.info_outline_rounded, color: Colors.grey[500],)
              ],
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
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
