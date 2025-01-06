import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/presentation/screens/profile/profile-sliders.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => GoRouter.of(context).pop(), // Navigate back
        ),
        title: const Text('Profile'),
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
                 
                  padding:  EdgeInsets.symmetric(horizontal: 100.w, vertical: 20.h),
                
                  child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 65.r,
                                  backgroundImage: const AssetImage(
                                      'assets/dummy_profile.png'), // Replace with your image
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.camera_alt, color: Colors.white),
                                      onPressed: () {
                                        // Add camera functionality here
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        
                        const SizedBox(height: 10),
                        // User Name
                        const Center(
                          child: Text(
                            'John Doe', // Dummy value
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              {'label': 'Name', 'value': 'John Doe', 'action': const ChangeEmail()},
              {'label': 'Mobile Number', 'value': '+1234567890', 'action': const ChangeMobileNo()},
              {'label': 'Email', 'value': 'johndoe@example.com', 'action': const ChangeEmail()},
              {'label': 'Date of Birth', 'value': '01 Jan 2000', 'action': null},
              {'label': 'PAN Number', 'value': 'ABCDE1234F', 'action': const AddPANNumber()},
              {'label': 'Aadhar Number', 'value': '1234 5678 9012', 'action': const AddAadharNumber()},
            ], context),

            // Business Info Section
            sectionHeader('Business Info'),
            infoSection([
              {'label': 'Business Name', 'value': 'John Enterprises', 'action': const AddBusinessName()},
              {'label': 'Business Address', 'value': '123 Main Street, City', 'action': const AddAddress()},
              {'label': 'GST Number', 'value': '22AAAAA0000A1Z5', 'action': const AddGSTNumber()},
              {'label': 'PAN Number', 'value': 'ABCDE1234F', 'action': const AddPANNumber()},
              {
                'label': 'Bank Details',
                'value': 'HDFC Bank, Account: 1234567890',
                'action': const AddBankDetails(),

              },
            ], context),

            // Other Section
            sectionHeader('Other'),
            otherOptions(context, [
              // Define actions for each option with unique content
              {
                'label': 'Change Password',
                'action': () => openBottomSheet(
                      context,
                      const ChangePassword(), // Opens Change Password content
                    ),
              },
              {
                'label': 'Logout',
                'action': () => openBottomSheet(
                      context,
                      const LogoutConfirmationContent(), // Opens Logout confirmation
                    ),
              },
            ]),
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
        padding:  EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Text(
          title,
          style:  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.grey[600]),
        ),
      ),
    );
  }

  // Method to render information sections
  Widget infoSection(List<Map<String, dynamic>> items, Context ) {
    return Container(
      color: whiteColor,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          return InkWell(
            onTap: () {
              openBottomSheet(
                      Context,
                      item['action'], 
                    );
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 12.h),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['label']!,
                          style:  TextStyle(fontSize: 16.sp, color: Colors.grey)),
                       SizedBox(height: 5.h),
                      Text(item['value']!, style:  TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold)),
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

  // Method to render other options with actions
  Widget otherOptions(
      BuildContext context, List<Map<String, dynamic>> options) {
    return Container(
      color: whiteColor,
      width: double.infinity,
      child: Column(
        children: options.map((option) {
          return ListTile(
            title: Text(option['label'], style:  TextStyle(fontSize: 16.sp, color: Colors.black)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: option['action'], // Trigger the specific action
          );
        }).toList(),
      ),
    );
  }

  // Method to open bottom sheets with dynamic content
  void openBottomSheet(BuildContext context, Widget content) {
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

// Widget for Change Password content
class ChangePasswordContent extends StatelessWidget {
  const ChangePasswordContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Change Password',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(labelText: 'Current Password'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'New Password'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'Confirm Password'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement change password logic
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

// Widget for Logout Confirmation content
class LogoutConfirmationContent extends StatelessWidget {
  const LogoutConfirmationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Are you sure you want to logout?',
            style: TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
              context.read<AuthCubit>().logout();


                context.go('/login'); // Navigate to login screen
                
              },
              child: const Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the bottom sheet
              },
              child: const Text('No'),
            ),
          ],
        ),
      ],
    );
  }
}
