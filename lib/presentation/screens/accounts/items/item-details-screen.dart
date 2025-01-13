import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itax/config/colors.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Nike Football',
        subtitle: '₹ 5,000',
        upperText1: 'Purchase Price',
        lowerText1: '₹ 4,800',
        upperText2: 'Current Stock',
        lowerText2: '50',
        upperText3: 'Stock Value',
        lowerText3: '₹ 2,40,000',
        onMorePressed: () => print('More options pressed'),
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 15.h),
      //   child: Row(
      //     children: [
      //       _buildStockButton('Stock Out', Colors.red),
      //       SizedBox(width: 8.w),
      //       _buildStockButton('Stock In', Colors.green),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.grey[200]?.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildDetailRow('Type', 'Item'),
                    SizedBox(height: 6.h,),
                    _buildDetailRow('Unit', 'PCS'),
                    SizedBox(
                      height: 6.h,
                    ),
                    _buildDetailRow('HSN/SAC Code', '0000'),
                    SizedBox(
                      height: 6.h,
                    ),
                    _buildDetailRow('Tax Rate', '0%'),
                    SizedBox(
                      height: 6.h,
                    ),
                    _buildDetailRow('Description', ''),
                    SizedBox(
                      height: 6.h,
                    ),
                    _buildDetailRow('New item added for Sale', ''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStockButton(String text, Color color) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final String upperText1;
  final String lowerText1;
  final String upperText2;
  final String lowerText2;
  final String upperText3;
  final String lowerText3;
  final VoidCallback? onMorePressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.upperText1,
    required this.lowerText1,
    required this.upperText2,
    required this.lowerText2,
    required this.upperText3,
    required this.lowerText3,
    this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppGradients.mainGradient,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Item Details',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_horiz, color: Colors.white),
                    onPressed: onMorePressed,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32.r,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/box.png', // Ensure this asset exists
                      width: 70.w,
                      height: 70.h,
                     
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildColumn(upperText1, lowerText1),
                  _buildColumn(upperText2, lowerText2),
                  _buildColumn(upperText3, lowerText3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColumn(String upperText, String lowerText) {
    return Column(
      children: [
        Text(
          upperText,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          lowerText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(250.h);
}


