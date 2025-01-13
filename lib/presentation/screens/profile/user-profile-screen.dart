import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/profile/profile-sliders.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

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
      leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: (){
        GoRouter.of(context).go('/dashboard');
      },),
        title:  Text('User Profile', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image and Name Section
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
                          'User Profile', // Dummy value
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

            // Personal Info Section
            sectionHeader('Personal Info'),
            infoSection([
              {
                'label': 'Full Name',
                'value': 'John Doe',
                'action': const ChangeEmail()
              },
              {
                'label': 'Date of Birth',
                'value': '01 Jan 2000',
                'action': null
              },
              {
                'label': 'Phone Number',
                'value': '+1234567890',
                'action': const ChangeMobileNo()
              },
              {
                'label': 'Father\'s Name',
                'value': 'Robert Doe',
                'action': null
              },
              {
                'label': 'PAN Number',
                'value': 'ABCDE1234F',
                'action': const AddPANNumber()
              },
              {
                'label': 'Aadhar Number',
                'value': '1234 5678 9012',
                'action': const AddAadharNumber()
              },
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
