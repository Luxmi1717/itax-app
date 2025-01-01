import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/presentation/screens/more-screens/slider-widgets/help-and-support-slider-widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  Text('More', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.sp)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromRGBO(76, 176, 80, 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Premium Membership',
                        style: TextStyle(color: Colors.white, fontSize: 24.sp)),
                    Text('Upgrade for more features',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 15.h,
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('My Companies'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                GoRouter.of(context).push('/my-companies');
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Manage User'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                GoRouter.of(context).push('/manage-users');
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('GSP Setup'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                GoRouter.of(context).push('/gsp-setup-login');
              },
            ),
            const Divider(color: Colors.grey, thickness: 3),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Other',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help and Support'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                openBottomSheet(context, const HelpAndSupportSliderWidget());
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.1,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Container(
              width: double.infinity,
              color: Colors.grey[300],
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Version 1.2.7',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void openBottomSheet(BuildContext context, Widget content) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        child: content,
      );
    },
  );
}
