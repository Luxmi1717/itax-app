import 'package:flutter/material.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/profile/profile-sliders.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Navigate back
        ),
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture with Camera Icon
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 17.w,
                    backgroundImage: AssetImage(
                        'assets/dummy_profile.png'), // Replace with your image
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: () {
                          // Add camera functionality here
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // User Name
            Center(
              child: Text(
                'John Doe', // Dummy value
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),

            // Personal Info Section
            sectionHeader('Personal Info'),
            infoSection([
              {'label': 'Name', 'value': 'John Doe', 'action': ChangeEmail()},
              {'label': 'Mobile Number', 'value': '+1234567890', 'action': ChangeMobileNo()},
              {'label': 'Email', 'value': 'johndoe@example.com', 'action': ChangeEmail()},
              {'label': 'Date of Birth', 'value': '01 Jan 2000', 'action': null},
              {'label': 'PAN Number', 'value': 'ABCDE1234F', 'action': AddPANNumber()},
              {'label': 'Aadhar Number', 'value': '1234 5678 9012', 'action': AddAadharNumber()},
            ], context),

            // Business Info Section
            sectionHeader('Business Info'),
            infoSection([
              {'label': 'Business Name', 'value': 'John Enterprises', 'action': AddBusinessName()},
              {'label': 'Business Address', 'value': '123 Main Street, City', 'action': AddAddress()},
              {'label': 'GST Number', 'value': '22AAAAA0000A1Z5', 'action': AddGSTNumber()},
              {'label': 'PAN Number', 'value': 'ABCDE1234F', 'action': AddPANNumber()},
              {
                'label': 'Bank Details',
                'value': 'HDFC Bank, Account: 1234567890',
                'action': AddBankDetails(),

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
                      ChangePassword(), // Opens Change Password content
                    ),
              },
              {
                'label': 'Logout',
                'action': () => openBottomSheet(
                      context,
                      LogoutConfirmationContent(), // Opens Logout confirmation
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['label']!,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(item['value']!, style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 20),
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
      color: Colors.grey[200],
      width: double.infinity,
      child: Column(
        children: options.map((option) {
          return ListTile(
            title: Text(option['label']),
            trailing: Icon(Icons.arrow_forward_ios),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Change Password',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(labelText: 'Current Password'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'New Password'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Confirm Password'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement change password logic
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}

// Widget for Logout Confirmation content
class LogoutConfirmationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Are you sure you want to logout?',
            style: TextStyle(fontSize: 18)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement logout logic
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text('No'),
            ),
          ],
        ),
      ],
    );
  }
}
