import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileTypeOne extends StatelessWidget {
  final String leadingText;
  final String trailingText;

  const TileTypeOne({
    super.key,
    required this.leadingText,
    required this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        ListTile(
          contentPadding:
               EdgeInsets.symmetric(horizontal: 20.w, ),
          title: Text(
            leadingText,
            style:  TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            trailingText,
            style:  TextStyle(fontSize: 19.sp, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
