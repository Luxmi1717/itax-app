import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/utility/dashboard-services.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 7.w),
          child: Image.asset(
              'assets/images/itaxlogo.png'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              // Handle QR scan action
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications action
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/user_profile.png'),             ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 55.h,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      color: mainBlueColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/dashboard/dashboard2.png', // Replace with your logo asset
                          height: 130.h,
                          width: 100.w,
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Smart Policy Choice',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Select Policies That Suit You',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: whiteColor),
                              ),
                              child: Text(
                                'CHOOSE POLICY',
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Divider(
              color: const Color.fromARGB(255, 226, 225, 225),
              thickness: 6,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 4.w),
                          height: 1,
                          color: mainBlueColor,
                        ),
                      ),
                      Text(
                        'Services',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: mainBlueColor),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 4.w),
                          height: 1,
                          color: mainBlueColor,
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 14.h),
                  GridView.count(
                    mainAxisSpacing: 4.h,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children:
                        List.generate(dashboardServicesList.length, (index) {
                      return InkWell(
                        onTap: () {
                          GoRouter.of(context).push(
                              dashboardServicesList[index].navigationPath);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 3.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(
                                      dashboardServicesList[index].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 80.h,
                              width: 90.w,
                            ),
                            SizedBox(
                                height:
                                    6.h), 
                            Text(
                              dashboardServicesList[index]
                                  .name, 
                              style: TextStyle(
                                fontSize: 15.sp, 
                                fontWeight: FontWeight.w500,
                                color: Colors.black, 
                              ),
                              textAlign: TextAlign.center,
                            ),
                            
                          ],
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
            SizedBox(height: 35.h),
            Divider(
              color: const Color.fromARGB(255, 226, 225, 225),
              thickness: 6,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 4.w),
                          height: 1,
                          color: mainBlueColor,
                        ),
                      ),
                      Text(
                        'Tools',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: mainBlueColor),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 4.w),
                          height: 1,
                          color: mainBlueColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  GridView.count(
                    
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(dashboardToolsList.length, (index) {
                      return InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .push(dashboardToolsList[index].navigationPath);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(
                                      dashboardToolsList[index].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 80.h,
                              width: 90.w,
                            ),
                            SizedBox(
                                height:
                                    6.h), 
                            Text(
                              dashboardToolsList[index].name,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        width: 140.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: mainBlueColor.withOpacity(0.1),
                          border: Border.all(color: mainBlueColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'View More',
                            style: TextStyle(
                              color: mainBlueColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    color: const Color.fromARGB(255, 240, 240, 240),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 25.h),
                      decoration: BoxDecoration(
            color: const Color.fromRGBO(221, 30, 99, 1), // Using the color
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fill your ITR for free',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  'Fill your Income Tax returns \nfor free in just minutes \n- Completely Free!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: whiteColor),
                                  ),
                                  child: Text(
                                    'Apply Now',
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                              'assets/images/dashboard/banner-logo.png', // Replace with your logo asset
                              height: 120.h,
                              width: 120.w),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 4.w),
                          height: 1,
                          color: mainBlueColor,
                        ),
                      ),
                      Text(
                        'Calculators',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: mainBlueColor),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 4.w),
                          height: 1,
                          color: mainBlueColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(calculatorsList.length, (index) {
                      return InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .push(calculatorsList[index].navigationPath);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 238, 238, 238),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  calculatorsList[index].imageUrl,
                                  height: 70.h,
                                  width: 70.w,
                                  // color: const Color.fromARGB(255, 122, 122, 122),
                                ),
                              ),
                              height: 80.h,
                              width: 90.w,
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              calculatorsList[index].name,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
