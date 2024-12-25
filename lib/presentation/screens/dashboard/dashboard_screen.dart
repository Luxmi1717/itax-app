import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/utility/dashboard-services.dart';
import 'package:sizer/sizer.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Image.asset(
              'assets/images/itaxlogo.png'), // Replace with your logo asset
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner),
            onPressed: () {
              // Handle QR scan action
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications action
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/user_profile.png'), // Replace with your user profile asset
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 9.h,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                        fontSize: 20.px,
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
              SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                      height: 20.h, 
                      width: 20.w, 
                    ),
                  );
                }),
              ),
              SizedBox(height: 4.h),
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
                        fontSize: 20.px,
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
              SizedBox(height: 1.h),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                      height: 20.h, 
                      width: 20.w, 
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
