import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/presentation/widgets/blue_button.dart';

class LoginSuccessSlider extends StatelessWidget {
  const LoginSuccessSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: 320.h,
      
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            // Row 1: Title
            Column(
              children: [
                Image.asset('assets/images/success.png', width: 60.h,),
                SizedBox(height: 25.w),
                Text(
                  'GSP Login Successful',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 127, 127, 127)
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Now you can generate eWay Bill & eInvoice',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color.fromARGB(255, 127, 127, 127)
                  ),
                ),
                SizedBox(height: 20.h,),
                BlueButton(title: 'Done', onPressed: (){
                  Navigator.of(context).pop();
                }),
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