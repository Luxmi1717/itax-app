import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';

class CompanyDetailsPage extends StatelessWidget {
  const CompanyDetailsPage({super.key});

  Widget _buildTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  Text('Company Details',
            style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: mainBlueColor),
                  onPressed: () {},
                ),
                const Text('Edit',
                    style: TextStyle(color: mainBlueColor, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 20.h),
            Center(
              child: Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: blackColor),
                  
                ),
                
                child: Image.asset('assets/images/itaxlogo.png', height: 100)),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('"Where Comfort Powers Performance"',
                    style: TextStyle(fontSize: 14,color: Colors.grey)),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
             SizedBox(height: 30.h),
            _buildTile('Business ', 'Shaiz Enterprise'),
            SizedBox(height: 16.h),
            
            _buildTile('GST Number', '22AAAAA0000A1Z5'),
            SizedBox(height: 16.h),
            _buildTile('Aadhar Number', '999941057058'),
            SizedBox(height: 16.h),
            _buildTile('PAN Number', 'ABCTY1234D'),
            SizedBox(height: 16.h),
            _buildTile('Mobile Number', '8466232323'),
            SizedBox(height: 16.h),
            _buildTile('Email ID', 'shaiz0702@gmail.com'),
            SizedBox(height: 16.h),
            _buildTile('Registration Number', '123456789'),
            const Divider(
              thickness: 2,
              color: Color.fromARGB(255, 211, 211, 211),
            ),

             Padding(padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Business Adress', style: TextStyle(fontSize: 20, color: blackColor, fontWeight: FontWeight.bold)),
                SizedBox(height: 12.h),
                Text('Akshya Nagar 1st Block 1st Cross, Rammurthy nagar',
                    style: TextStyle(fontSize: 12.sp, )),
                                    SizedBox(height: 6.h),

                    Row(children: [
                      Text('State:',style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 6.h),

                                            Text(
                        'Karnataka:',
                        style: TextStyle(color: Colors.black),
                      ),



                    ],),
                    Row(
                    children: [
                      Text(
                        'Pincode:',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '560016:',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
