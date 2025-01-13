import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/profile/profile-sliders.dart';

class BusinessProfilePage extends StatelessWidget {
  const BusinessProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            GoRouter.of(context).go('/dashboard');
          },
        ),
        title: Text('Business Profile',
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 100.w, vertical: 20.h),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      // User Name
                      Center(
                        child: Text(
                          'Business Profile', // Dummy value
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            sectionHeader('Business Info'),
            infoSection([
              {'label': 'GSTIN Status', 'value': 'Active', 'action': null},
              {
                'label': 'Business Name',
                'value': 'John Enterprises',
                'action': const AddBusinessName()
              },
              {'label': 'Trade Name', 'value': 'John Traders', 'action': null},
              {
                'label': 'PAN Number',
                'value': 'ABCDE1234F',
                'action': const AddPANNumber()
              },
              {
                'label': 'Address',
                'value': '123 Main Street, City',
                'action': const AddAddress()
              },
              {'label': 'State', 'value': 'California', 'action': null},
              {'label': 'Pin Code', 'value': '90001', 'action': null},
            ], context),
          ],
        ),
      ),
    );
  }

  // Method to render section headers
  Widget sectionHeader(String title) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600]),
        ),
      ),
    );
  }

  // Method to render information sections
  Widget infoSection(List<Map<String, dynamic>> items, BuildContext context) {
    return Container(
      color: whiteColor,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          return InkWell(
            onTap: () {
              openBottomSheet(context, item['action']);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['label']!,
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.grey)),
                      SizedBox(height: 5.h),
                      Text(item['value']!,
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 20),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Method to open bottom sheets with dynamic content
  void openBottomSheet(BuildContext context, Widget content) {
    if (content != null) {
      showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: content, // Display specific content passed as parameter
          );
        },
      );
    }
  }
}
