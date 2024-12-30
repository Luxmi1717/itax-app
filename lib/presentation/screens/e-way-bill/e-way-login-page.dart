import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/e-way-bill/slider-widgets/gsp-login-slider.dart';
import 'package:itax/presentation/widgets/blue_button.dart';

class EWayLogin extends StatelessWidget {
  const EWayLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 20.w),
        child: BlueButton(
          title: 'Process to GSP Login',
          onPressed: () {
            openBottomSheet(context, GspLoginSlider());
          },
        ),
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
GoRouter.of(context).go('/e-way-details');
            },
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Text(
                'Go to details',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
        title: Text(
          'Login eWay Bill User',
          style: TextStyle(color: whiteColor, fontSize: 22.sp),
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Follow below steps to register with your GST ',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Suvidha Provider(GSP) on E-way Bill Portal",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 228, 228, 228),
              ),
              child: Text(
                'Step 1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w , vertical: 8.h),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle,
                          color: Colors.green, size: 20.sp),
                      SizedBox(width: 12.w),
                      Flexible(
                        child: Text(
                          'Login to E-way Bill Portal : https://ewaybillgst.gov.in/',
                          style: TextStyle(fontSize: 17.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle,
                          color: Colors.green, size: 20.sp),
                      SizedBox(width: 12.w),
                      Flexible(
                        child: Text(
                          'Click on Registration in the left menu & select For GSP',
                          style: TextStyle(fontSize: 17.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle,
                          color: Colors.green, size: 20.sp),
                      SizedBox(width: 12.w),
                      Flexible(
                        child: Text(
                          'Click Send OTP',
                          style: TextStyle(fontSize: 17.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle,
                          color: Colors.green, size: 20.sp),
                      SizedBox(width: 12.w),
                      Flexible(
                        child: Text(
                          'Verify OTP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 228, 228, 228),
              ),
              child: Text(
                'Step 2',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle,
                          color: Colors.green, size: 20.sp),
                      SizedBox(width: 12.w),
                      Flexible(
                        child: Text(
                          'Click the Add/New Button',
                          style: TextStyle(fontSize: 17.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle,
                          color: Colors.green, size: 20.sp),
                      SizedBox(width: 12.w),
                      Flexible(
                        child: Text(
                          'Select your GST Suvidha Provider (GSP) in the GSP Name dropdown',
                          style: TextStyle(fontSize: 17.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle,
                          color: Colors.green, size: 20.sp),
                      SizedBox(width: 12.w),
                      Flexible(
                        child: Text(
                          'Enter 3 letter Suffix ID and a password',
                          style: TextStyle(fontSize: 17.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle,
                          color: Colors.green, size: 20.sp),
                      SizedBox(width: 12.w),
                      Flexible(
                        child: Text(
                          'Re-enter the User Name & Password & Click ADD',
                          style: TextStyle(fontSize: 17.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void openBottomSheet(BuildContext context, Widget content) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        child: content,
      );
    },
  );
}
