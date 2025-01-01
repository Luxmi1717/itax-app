import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';

class MyCompaniesPage extends StatelessWidget {
  const MyCompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              icon:  Icon(Icons.search, color: blackColor, size: 35.sp,),
              onPressed: () {},
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  Text('My Companies',
            style: TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    tileColor: whiteColor,
                    leading: Image.asset('assets/images/company-logo.png'),
                    title: const Text('Demo Company', style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    onTap: () {
                      GoRouter.of(context).push('/company-details-page');
                    },
                  ),
                  ListTile(
                    tileColor: whiteColor,
                    leading:  Image.asset('assets/images/company-logo.png'),
                    title: const Text('Shaiz Enterprises', style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.1,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100.h, 
            right: 40.w, // Adjust the horizontal position
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: const Text(
                'Add Company',
                style: TextStyle(color: whiteColor),
              ),
              icon: const Icon(
                Icons.business,
                color: whiteColor,
              ),
              backgroundColor: mainBlueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
