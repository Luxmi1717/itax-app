import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/utility/dashboard-services.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 7.w),
          child: Image.asset(
              'assets/images/itaxlogo.png'), // Replace with your logo asset
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
                  'assets/user_profile.png'), // Replace with your user profile asset
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(dashboardServicesList.length, (index) {
                  return InkWell(
                    onTap: () {
                      // Handle tap action
                    },
                    child: Container(
                      margin: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image:
                              AssetImage(dashboardServicesList[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 18.h, 
                      width: 18.w, 
                    ),
                  );
                }),
              ),
              SizedBox(height: 40.h),
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
                  SizedBox(height: 20.h,),
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
                      // Handle tap action
                    },
                    child: Container(
                      margin: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(dashboardToolsList[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 18.h, 
                      width: 18.w, 
                    ),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10.w),
                    padding: EdgeInsets.symmetric(horizontal:  10.w,vertical: 5.h),
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
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                decoration: BoxDecoration(
                  color: Colors.red,
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
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
                    SizedBox(width: 10.w),
                    CircleAvatar(
                      radius: 30.w,
                      backgroundImage: AssetImage('assets/photo.png'), // Replace with your photo asset
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
