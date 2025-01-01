import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/main.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-1-tile.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-2-tile.dart';
import 'package:itax/presentation/widgets/appbars/custom-appbar.dart';

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
      appBar: CustomAppBar(
        title: '₹ 50,21,333',
        subtitle: 'Total Receipt',
        pageTitle: 'Receipt',
        onBackPressed: () {
          GoRouter.of(context).push('/home');
        },
      ),
      body: Column(
        children: [
          // Horizontal Scrollable Tags
          Container(
            height: 40.h,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                    margin:  EdgeInsets.symmetric(horizontal: 8.w),
                    padding:  EdgeInsets.symmetric(
                        horizontal: 42.w, vertical: 8.h),
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
                        fontSize: 14.sp,
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
              GoRouter.of(context).push('/receipt-day-wise');
            },
          ),
          TileTypeOne(
            leadingText: 'Dec 24',
            trailingText: '₹ 3,33,200',
            onTap: () {
              GoRouter.of(context).push('/receipt-day-wise');
            },
          ),
          TileTypeOne(
            leadingText: 'Jan 23',
            trailingText: '₹ 11,200',
            onTap: () {
              GoRouter.of(context).push('/receipt-day-wise');
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
              GoRouter.of(context).push('/receipt-per-user');
            },
          ),
          TileTypeTwo(
            leadingText: 'Sanjay Sharma',
            subText: 'Mob: 8825464741  |  GST: 22AAAAA0000A1Z5',
            trailingText: '₹ 28,305',
            onTap: () {
              GoRouter.of(context).push('/receipt-per-user');
            },
          ),
        ],
      ),
    );
  }
}
