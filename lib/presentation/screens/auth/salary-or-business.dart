import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/widgets/blue_button.dart';

class SalaryOrBusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.mainGradient,
        ),
      ),
    title: Text('Choose your work type', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white)),
       
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'I work as?',
              style: TextStyle(fontSize: 24.sp),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: Column(
                children: <Widget>[
                  BlueButton(
                    onPressed: () {
                      GoRouter.of(context).go('/salaried-profile-aadhaar');
                      
                    },
                    title: 'Salaried',

                  ),
                  SizedBox(height: 20.h),
                  BlueButton(
                    onPressed: () {
                       GoRouter.of(context).go('/business-profile-aadhaar');
                      
                    },
                    title: 'Business Owner',

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}