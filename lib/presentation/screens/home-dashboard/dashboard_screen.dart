import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/profile/profile-screen.dart';
import 'package:itax/presentation/widgets/dashboard-diamond-container.dart';
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
          child: Image.asset('assets/images/itaxlogo.png'),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.qr_code_scanner,
              size: 27.sp,
            ),
            onPressed: () {
              // Handle QR scan action
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              size: 27.sp,
            ),
            onPressed: () {
              // Handle notifications action
            },
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProfilePage();
              }));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: CircleAvatar(
                radius: 17.r,
                backgroundImage: AssetImage('assets/user_profile.png'),
              ),
            ),
          ),
          SizedBox(width: 5.w),
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
                        filled: true,
                        fillColor: const Color.fromARGB(255, 239, 239, 239),
                        hintText: 'Search...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
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
                          height: 120.h,
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
                            SizedBox(height: 15.h),
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
            SizedBox(height: 4.h),
            Divider(
              color: const Color.fromARGB(255, 226, 225, 225),
              thickness: 6,
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
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
                      // Text(
                      //   'Services',
                      //   style: TextStyle(
                      //       fontSize: 20.sp,
                      //       fontWeight: FontWeight.bold,
                      //       color: mainBlueColor),
                      // ),
                      DashboardDiamondContainer(text: 'Services'),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 4.w),
                          height: 1,
                          color: mainBlueColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
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
                                  horizontal: 3.w, vertical: 1.h),
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
                            SizedBox(height: 6.h),
                            Text(
                              dashboardServicesList[index].name,
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
            SizedBox(height: 15.h),
            Divider(
              color: const Color.fromARGB(255, 226, 225, 225),
              thickness: 6,
            ),
            SizedBox(height: 15.h),
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
                      DashboardDiamondContainer(text: 'View'),
                      SizedBox(
                        height: 15.h,
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
                  SizedBox(height: 15.h),
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 1.h),
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
                            SizedBox(height: 6.h),
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
                        width: 130.w,
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
                  SizedBox(height: 10.h),
//                   Container(
//   decoration: BoxDecoration(
//     color: Color.fromARGB(255, 240, 240, 240),
//     borderRadius: const BorderRadius.only(
//       topLeft: Radius.elliptical(30, 40),
//       topRight: Radius.elliptical(30, 40),
//       bottomLeft: Radius.elliptical(30, 40),
//       bottomRight: Radius.elliptical(30, 40),
//     ),
//   ),
//   width: double.infinity,
//   child: Container(
//     padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
//     decoration: BoxDecoration(
//       color: const Color.fromRGBO(221, 30, 99, 1),
//       borderRadius: const BorderRadius.only(
//         topLeft: Radius.elliptical(30, 40),
//         topRight: Radius.elliptical(30, 40),
//         bottomLeft: Radius.elliptical(30, 40),
//         bottomRight: Radius.elliptical(30, 40),
//       ),
//     ),
//     child: Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Fill your ITR for free',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 5.h),
//               Text(
//                 'Fill your Income Tax returns \nfor free in just minutes \n- Completely Free!',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 10.sp,
//                 ),
//               ),
//               SizedBox(height: 10.h),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: whiteColor),
//                 ),
//                 child: Text(
//                   'Apply Now',
//                   style: TextStyle(
//                     color: whiteColor,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Image.asset(
//           'assets/images/dashboard/banner-logo.png',
//           height: 120.h,
//           width: 120.w,
//         ),
//       ],
//     ),
//   ),
// ),

                  SvgPicture.asset(
                    'assets/images/itr-banner.svg',
                    height: 150.h,
                    width: 160.w,
                  ),
                  SizedBox(height: 15.h),
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
                      DashboardDiamondContainer(text: 'Calculators'),
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 1.h),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 238, 238, 238),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 56.h,
                              width: 90.w,
                              child: Center(
                                child: SvgPicture.asset(
                                  calculatorsList[index].imageUrl,
                                  height: 56.h,
                                  width: 50.w,
                                ),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                calculatorsList[index].name,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow:
                                    TextOverflow.ellipsis, // Prevents overflow
                                maxLines: 2, // Limits text to 2 lines
                              ),
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
