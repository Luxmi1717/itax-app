import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';

class BankAddMoneyPage extends StatelessWidget {
  const BankAddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
        title: const Text(
          'Add Money',
          style: TextStyle(color: whiteColor, fontSize: 20),
        ),
        leading: InkWell(onTap:(){
          GoRouter.of(context).go('/home');
        },child: const Icon(Icons.arrow_back_ios, color: whiteColor, )),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: whiteColor),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: whiteColor),
            onPressed: () {},
          ),
          
          
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Monu Pathak',
                    style: TextStyle(fontSize: 14.sp, color: blackColor),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '14 Nov 24',
                    style: TextStyle(fontSize: 12.sp, color: blackColor),
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListTile(
              leading: Text(
                'Amount',
                style: TextStyle(fontSize: 16.sp, color: blackColor),
              ),
              trailing: Text(
                '+ ₹ 1,28,300',
                style: TextStyle(fontSize: 16.sp, color: Colors.green),
              ),
            ),
          ),
          Divider(thickness: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListTile(
              leading: Text(
                'Account',
                style: TextStyle(fontSize: 16.sp, color: blackColor),
              ),
              trailing: Text(
                'State Bank Of India',
                style: TextStyle(fontSize: 16.sp, color: blackColor),
              ),
            ),
          ),
          Divider(thickness: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListTile(
              leading: Text(
                'Payment For',
                style: TextStyle(fontSize: 16.sp, color: blackColor),
              ),
              trailing: Text(
                'Others',
                style: TextStyle(fontSize: 16.sp, color: blackColor),
              ),
            ),
          ),
          Divider(thickness: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Remarks',
                  style: TextStyle(fontSize: 16.sp, color: blackColor),
                ),
                SizedBox(height: 5.h),
                Text(
                  'This is a test remark Lore Ispum dior sit amet',
                  style: TextStyle(fontSize: 14.sp, color: blackColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
