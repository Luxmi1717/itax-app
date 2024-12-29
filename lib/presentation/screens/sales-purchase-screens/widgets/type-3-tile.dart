import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileTypeThree extends StatelessWidget {
  final String leadingText1;
  final String leadingText2;
  final String leadingText3;
  final String trailingText;
  final bool ifTrailingContainer;
  final bool ifGreen;
  final String trailingContainerContent;

  const TileTypeThree({
    super.key,
    required this.leadingText1,
    required this.leadingText2,
    required this.leadingText3,
    required this.trailingText,
    required this.ifTrailingContainer,
    required this.trailingContainerContent,
    required this.ifGreen,
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
              Text(
                leadingText1,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                style:  TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 7.0),
              ifTrailingContainer ? 
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: ifGreen ? Colors.green.withOpacity(0.1): const Color.fromARGB(255, 190, 190, 190),
                borderRadius: BorderRadius.circular(4),
              ),
                child: Text(
                  trailingContainerContent,
                  style:  TextStyle(fontSize: 12.sp, color: ifGreen ? Colors.green: Colors.black),
                ),)
              : Container(),
              
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
