import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/accounts/widgets/customer-details-tile-widget.dart';
import 'package:itax/presentation/widgets/financial_year_widget.dart';
import 'package:itax/utility/functions.dart';

class CustomDetailsPage extends StatefulWidget {
  const CustomDetailsPage({super.key});

  @override
  State<CustomDetailsPage> createState() => _CustomDetailsPageState();
}

class _CustomDetailsPageState extends State<CustomDetailsPage> {
  final List<String> tags = ["All", "Paid", "UnPaid"];
  int selectedIndex = 0;

  final Map<int, Widget> content = {
    0: const AllSection(),
    1: const PaidSection(),
    2: const UnpaidSection(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerDetailsAppBar(
        pageTitle: 'Customer Details',
        subtitle: '₹ 1,02,500 (Receivables)',
        title: 'Monu Pathak',
        onBackPressed: () {},
      ),
      body: Column(
        children: [
          // Tags Section
          Row(
            children: [
              SizedBox(width: 16.w),
              Expanded(
                child: Container(
                  height: 45.h,
                  margin:  EdgeInsets.symmetric(vertical: 6.h),
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
                          margin:  EdgeInsets.symmetric(horizontal: 5.w),
                          padding:  EdgeInsets.symmetric(
                              horizontal: 32.w, vertical: 2.h),
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
                          child: Center(
                            child: Text(
                              tags[index],
                              style: TextStyle(
                                color: isSelected ? mainBlueColor : Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const Divider(thickness: 0.8),
          FinancialYearWidget(),

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

// Overview Section
class AllSection extends StatelessWidget {
  const AllSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
        //  CustomerDetailsTile(leadingText1: '#123', leadingText2: '13', leadingText3: leadingText3, trailingText: trailingText, paid: paid, ifEInvoice: ifEInvoice, ifEWay: ifEWay)
          CustomerDetailsTile(
            leadingText1: '#123',
            leadingText2: 'John Doe',
            leadingText3: 'Sample Address',
            trailingText: '₹500',
            ifPaid: true,
            ifEInvoice: false,
            ifEWay: true,
          ),
          CustomerDetailsTile(
            leadingText1: '#123',
            leadingText2: 'John Doe',
            leadingText3: 'Sample Address',
            trailingText: '₹500',
            ifPaid: true,
            ifEInvoice: true,
            ifEWay: true,
          ),

        ],
      ),
    );
  }
}

// Transactions Section
class PaidSection extends StatelessWidget {
  const PaidSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomerDetailsTile(
            leadingText1: '#123',
            leadingText2: 'John Doe',
            leadingText3: 'Sample Address',
            trailingText: '₹500',
            ifPaid: true,
            ifEInvoice: true,
            ifEWay: true,
          ),
          CustomerDetailsTile(
            leadingText1: '#123',
            leadingText2: 'John Doe',
            leadingText3: 'Sample Address',
            trailingText: '₹500',
            ifPaid: true,
            ifEInvoice: true,
            ifEWay: true,
          ),

          CustomerDetailsTile(
            leadingText1: '#123',
            leadingText2: 'John Doe',
            leadingText3: 'Sample Address',
            trailingText: '₹500',
            ifPaid: true,
            ifEInvoice: true,
            ifEWay: true,
          ),
          CustomerDetailsTile(
            leadingText1: '#123',
            leadingText2: 'John Doe',
            leadingText3: 'Sample Address',
            trailingText: '₹500',
            ifPaid: true,
            ifEInvoice: true,
            ifEWay: true,
          ),
        ],
      ),
    );
  }
}

class UnpaidSection extends StatelessWidget {
  const UnpaidSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomerDetailsTile(
            leadingText1: '#123',
            leadingText2: 'John Doe',
            leadingText3: 'Sample Address',
            trailingText: '₹500',
            ifPaid: true,
            ifEInvoice: true,
            ifEWay: true,
          ),
          CustomerDetailsTile(
            leadingText1: '#123',
            leadingText2: 'John Doe',
            leadingText3: 'Sample Address',
            trailingText: '₹500',
            ifPaid: true,
            ifEInvoice: true,
            ifEWay: true,
          ),
          CustomerDetailsTile(
            leadingText1: '#123',
            leadingText2: 'John Doe',
            leadingText3: 'Sample Address',
            trailingText: '₹500',
            ifPaid: true,
            ifEInvoice: true,
            ifEWay: true,
          ),
        ],
      ),
    );
  }
}



// Custom AppBar
class CustomerDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;
  final String subtitle;
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onSortPressed;
  final VoidCallback? onMorePressed;

  const CustomerDetailsAppBar({
    Key? key,
    required this.pageTitle,
    required this.subtitle,
    required this.title,
    this.onBackPressed,
    this.onSearchPressed,
    this.onSortPressed,
    this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppGradients.mainGradient,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button and Text
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new,
                            color: Colors.white),
                        onPressed: onBackPressed,
                      ),
                      Text(
                        pageTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                        ),
                      ),
                    ],
                  ),

                  // Trailing Icons
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: onSearchPressed,
                      ),
                      IconButton(
                        icon: const Icon(Icons.sort, color: Colors.white),
                        onPressed: onSortPressed,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 14.h),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colors.white,
                    child: Text(
                      'M',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children:  [
                      SvgPicture.asset('assets/itax-icons/accounts-icons/wtspp.svg', height: 24.h, width: 24.w),
                      const Text('Whatsapp', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const Column(
                    children: [
                      Icon(Icons.phone, color: Colors.white),
                      Text('Call', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const Column(
                    children: [
                      Icon(Icons.email, color: Colors.white),
                      Text('Email', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const Column(
                    children: [
                      Icon(Icons.more_horiz, color: Colors.white),
                      Text('More', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(260.h); // Adjust as needed
}
