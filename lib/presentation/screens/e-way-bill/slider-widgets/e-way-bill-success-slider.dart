import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/e-way-bill/e-way-details-page.dart';
import 'package:itax/presentation/screens/e-way-bill/slider-widgets/download-options-slider.dart';
import 'package:itax/presentation/screens/e-way-bill/slider-widgets/e-invoice-sucess-slider.dart';
import 'package:itax/presentation/widgets/blue_button.dart';

class EwayBillSuccessSlider extends StatelessWidget {
  const EwayBillSuccessSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.print, color: Colors.black),
                SizedBox(width: 7.w),
                Icon(Icons.share, color: Colors.black),
              ],
            ),
            SizedBox(height: 20.h),
            // Row 1: Title
            Column(
              children: [
                Image.asset(
                  'assets/images/success.png',
                  width: 60.h,
                ),
                SizedBox(height: 25.w),
                Text(
                  'E-Way Bill Generated',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 127, 127, 127)),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Your E-Way Bill has been created and is ready for use.',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color.fromARGB(255, 127, 127, 127)),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Distribute evenly
                  children: [
                    // BlueButton
                    Expanded(
                      child: BlueButton(
                        title: 'Download',
                        onPressed: () {
                          Navigator.of(context).pop();
                          openBottomSheet(context, DownloadOptionsSlider());
                        },
                      ),
                    ),
                    SizedBox(width: 10.w),
                    // Create Invoice Button
                    InkWell(
                      onTap: (){
                        openBottomSheet(context, EInvoiceSuccessSlider() );
                      },
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: mainBlueColor, width: 1),
                          ),
                          child: Text(
                            'Create Invoice',
                            style: TextStyle(
                              color: mainBlueColor,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Row 2: Tiles
          ],
        ),
      ),
    );
  }
}
