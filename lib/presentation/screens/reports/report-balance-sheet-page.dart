import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/e-way-bill/slider-widgets/download-options-slider.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-1-tile.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-2-tile.dart';
import 'package:itax/presentation/widgets/appbars/custom-appbar.dart';
import 'package:itax/utility/functions.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  _SalesMonthlyPageState createState() => _SalesMonthlyPageState();
}

class _SalesMonthlyPageState extends State<ReceiptPage> {
  final List<String> tags = [
    "Monthly",
    "Customers",
  ];
  int selectedIndex = 0;

  final Map<int, Widget> content = {
    0: const MonthlySection(),
    1: const CustomersSection(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        },
        icon: Icon(Icons.add_outlined, color: whiteColor),
        label: Text('Add New Entry', style: TextStyle(color: whiteColor, fontSize: 16.sp)),
        backgroundColor: mainBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        
        child: Row(
          children: [
            Text('Total Assets', style: TextStyle(color: whiteColor, fontSize: 16.sp)),
            Spacer(),
            Text('₹ 50,21,333', style: TextStyle(color: whiteColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
            
           
          ],
        ),
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        actions: [
          InkWell(
            onTap: () {
              openBottomSheet(context, const DownloadOptionsSlider());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Horizontal Scrollable Tags
          Container(
            height: 40.0,
            width: double.maxFinite,
            margin:  EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected
                            ? mainBlueColor
                            : (Colors.grey[300] ?? Colors.grey),
                        width: 1.0,
                      ),
                      color: isSelected
                          ? const Color.fromARGB(255, 221, 232, 248)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      tags[index],
                      style: TextStyle(
                        color: isSelected ? mainBlueColor : Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: mainBlueColor,
                ),
                Text('Financial Year',
                    style: TextStyle(color: blackColor, fontSize: 14)),
                Text(' (1Apr 24 to 31 Mar 25)'),
                Spacer(),
                Text('Change',
                    style: TextStyle(color: mainBlueColor, fontSize: 14)),
              ],
            ),
          ),

          const Divider(thickness: 3),

          // Dynamic Content Area
          Expanded(
            child: content[selectedIndex] ?? const Text("No data available"),
          ),
        ],
      ),
    );
  }
}

class MonthlySection extends StatelessWidget {
  const MonthlySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TileTypeOne(
            leadingText: 'Nov 24',
            trailingText: '₹ 11,200',
            onTap: () {
              GoRouter.of(context).go('/receipt-day-wise');
            },
          ),
          TileTypeOne(
            leadingText: 'Dec 24',
            trailingText: '₹ 3,33,200',
            onTap: () {
              GoRouter.of(context).go('/receipt-day-wise');
            },
          ),
          TileTypeOne(
            leadingText: 'Jan 23',
            trailingText: '₹ 11,200',
            onTap: () {
              GoRouter.of(context).go('/receipt-day-wise');
            },
          ),
        ],
      ),
    );
  }
}

class CustomersSection extends StatelessWidget {
  const CustomersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TileTypeTwo(
            leadingText: 'Monu Pathak',
            subText: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5',
            trailingText: '₹ 7,20,200',
            onTap: () {
              GoRouter.of(context).go('/receipt-per-user');
            },
          ),
          TileTypeTwo(
            leadingText: 'Sanjay Sharma',
            subText: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5',
            trailingText: '₹ 28,305',
            onTap: () {
              GoRouter.of(context).go('/receipt-per-user');
            },
          ),
        ],
      ),
    );
  }
}
