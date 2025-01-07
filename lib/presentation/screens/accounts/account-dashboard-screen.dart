import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';

class AccountDashboard extends StatelessWidget {
  const AccountDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Shaiz Enterprises',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200.h,
                      child: Center(
                        child: Text('Bottom Slider Content'),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Image.asset('assets/images/itaxlogo.png'),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(width: 22.w),
                              _buildTopContainer(
                                context,
                                backgroundColor:
                                    Color.fromRGBO(231, 77, 72, 0.85),
                                image:
                                    'assets/images/dashboard/profit-loss-logo.png',
                                title: 'Focus on',
                                subtitle: 'Profit-Loss',
                                buttonText: 'VIEW REPORT',
                              ),
                              _buildTopContainer(
                                context,
                                backgroundColor:
                                    Color.fromRGBO(231, 77, 72, 0.85),
                                image:
                                    'assets/images/dashboard/profit-loss-logo.png',
                                title: 'Focus on',
                                subtitle: 'Profit-Loss',
                                buttonText: 'VIEW REPORT',
                              ),
                              SizedBox(width: 22.w),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 12.h),
                        child: Row(
                          children: [
                            Text(
                              'Statistics',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'This Year',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down,
                                      color: Colors.black),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Image.asset('assets/images/dashboard/graph.png'),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 35.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '₹ 2,30,300',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Sales',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 30.w),
                              height: 40.h,
                              width: 1.w,
                              color: Colors.black,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '₹ 2,300',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Purchase',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          thickness: 7.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 23.w, vertical: 12.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Overview',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'This Year',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down,
                                          color: Colors.black),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 18.h),
                            CustomListTile(
                              icon:
                                  'assets/itax-icons/accounts-icons/receipt.svg',
                              leadingText: 'Receipt',
                              trailingText: '₹ 2,30,300',
                              onTap: () {
                                GoRouter.of(context).push('/receipt-page');
                              },
                            ),
                            CustomListTile(
                              icon:
                                  'assets/itax-icons/accounts-icons/payment.svg',
                              leadingText: 'Payment',
                              trailingText: '₹ 2,300',
                              onTap: () {
                                GoRouter.of(context).push('/payment-page');
                              },
                            ),
                            CustomListTile(
                              icon: 'assets/itax-icons/accounts-icons/bank.svg',
                              leadingText: 'Bank',
                              trailingText: '₹ 2,30,300',
                              onTap: () {
                                GoRouter.of(context).push('/all-banks');
                              },
                            ),
                            CustomListTile(
                              icon: 'assets/itax-icons/accounts-icons/cash.svg',
                              leadingText: 'Cash',
                              trailingText: '₹ 2,300',
                              onTap: () {
                                GoRouter.of(context).push('/all-banks');
                              },
                            ),
                            CustomListTile(
                              icon:
                                  'assets/itax-icons/accounts-icons/credit-note.svg',
                              leadingText: 'Credit Note',
                              trailingText: '₹ 2,30,300',
                              onTap: () {
                                GoRouter.of(context).push('/debit-page');
                              },
                            ),
                            CustomListTile(
                              icon:
                                  'assets/itax-icons/accounts-icons/debit-note.svg',
                              leadingText: 'Debit Note',
                              trailingText: '₹ 2,300',
                              onTap: () {
                                GoRouter.of(context).push('/debit-page');
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Divider(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          thickness: 7.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 20.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.light),
                                Text(
                                  'Quick Create',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: AssetImage(''),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      height: 80.h,
                                      width: 90.w,
                                    ),
                                    SizedBox(
                                        height:
                                            8), // Space between the image and the text
                                    Text(
                                      'Sales\nInvoice',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: AssetImage(''),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      height: 80.h,
                                      width: 90.w,
                                    ),
                                    SizedBox(
                                        height:
                                            8), // Space between the image and the text
                                    Text(
                                      'New\nCustomer',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: AssetImage(''),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      height: 80.h,
                                      width: 90.w,
                                    ),
                                    SizedBox(
                                        height:
                                            8), // Space between the image and the text
                                    Text(
                                      'New\nItem',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Divider(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          thickness: 7.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 20.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Cash Flow',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'This Year',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down,
                                          color: Colors.black),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 22.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 15.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.green, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 237, 251, 238),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '₹ 1,50,000',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Receivables',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.green),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 15.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.red, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 249, 230, 232),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '₹ 76,450',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Payables',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50.h,
            right: 30.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: mainBlueColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.merge_type, color: whiteColor, size: 30.sp),
                  Text('Create Entry',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: whiteColor)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopContainer(
    BuildContext context, {
    required Color backgroundColor,
    required String image,
    required String title,
    required String subtitle,
    required String buttonText,
  }) {
    return Container(
      width: 300.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(image, height: 120.h, width: 120.w),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String icon;
  final String leadingText;
  final String trailingText;
  final void Function()? onTap;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.leadingText,
    required this.trailingText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Container(
              width: 27.w,
              height: 27.w,
              padding: EdgeInsets.all(2.w),
              color: Colors.grey[100],
              child: SvgPicture.asset(icon)),
          title: Text(leadingText,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              )),
          trailing: Text(trailingText,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      ),
    );
  }
}

Widget _buildTopContainer2(
  BuildContext context, {
  required Color backgroundColor,
  required String image,
  required String title,
  required String subtitle,
  required String buttonText,
}) {
  return Container(
    width: 300.w,
    margin: EdgeInsets.symmetric(horizontal: 8.w),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Image.asset(image, height: 120.h, width: 120.w),
      ],
    ),
  );
}
