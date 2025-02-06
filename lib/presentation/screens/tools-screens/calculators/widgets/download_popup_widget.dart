import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownloadPopup extends StatelessWidget {
  final void Function() onDownloadPDF;
  final void Function() onDownloadImage;
  const DownloadPopup({super.key, required this.onDownloadPDF, required this.onDownloadImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade500),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          InkWell(
            onTap: onDownloadPDF,
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: 8.h), // Increased margin to prevent crowding
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Download as PDF',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey.shade700),
                ],
              ),
            ),
          ),
      
          InkWell(
            onTap: onDownloadImage,
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: 8.h), // Increased margin to prevent crowding
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Download as Image',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey.shade700),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



void showDownloadPopup(
  BuildContext context, {
  required VoidCallback onDownloadPDF,
  required VoidCallback onDownloadImage,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: DownloadPopup(
            onDownloadPDF: onDownloadPDF,
            onDownloadImage: onDownloadImage,
          ),
        ),
      );
    },
  );
}
