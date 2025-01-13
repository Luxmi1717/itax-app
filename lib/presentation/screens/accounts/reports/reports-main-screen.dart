import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';

class ReportsBasePage extends StatelessWidget {
  const ReportsBasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: Text(
          'Reports',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 15.h),
          child: Column(
            children: [
                GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Icon(Icons.insert_chart, size: 40.sp, color: Colors.blue),
                    SizedBox(height: 10.h),
                    Text(
                      'Big Text',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Small Text',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    ],
                  ),
                  );
                },
                ),

                SizedBox(height: 20.h),
                GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Icon(Icons.insert_chart, size: 40.sp, color: Colors.blue),
                    SizedBox(height: 10.h),
                    Text(
                      'Big Text',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Small Text',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    ],
                  ),
                  );
                },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
