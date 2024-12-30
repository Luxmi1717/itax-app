import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sort-by-slider-widget.dart';

class ReceivableUserPage extends StatelessWidget {
  const ReceivableUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageTitle: 'Receivables', subtitle: '₹ 1,02,500', title: 'Monu Pathak', onBackPressed: () {}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTile(
              id: '#231',
              dueDate: '12 Nov 2024',
              daysRemaining: '5',
              amount: '₹ 12,500',
              onWhatsAppPressed: () {},
              onPdfPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}





//---------------- NAVBAR CODE ---------------------------------------

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle; // Upper text
  final String subtitle; // Lower text
  final String title; // Text next to back icon
  final VoidCallback? onBackPressed; // Back button action
  final VoidCallback? onSearchPressed; // Search button action
  final VoidCallback? onSortPressed; // Sort button action
  final VoidCallback? onMorePressed; // More button action

  const CustomAppBar({
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
                        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
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
                        onPressed: () {
                        
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.sort, color: Colors.white),
                        onPressed: (){
                            openBottomSheet(context, SortByOptionsSlider());
                        },
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
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.home, color: Colors.white),
                      Text('Whatsapp', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.phone, color: Colors.white),
                      Text('Call', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.email, color: Colors.white),
                      Text('Email', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.person, color: Colors.white),
                      Text('Profile', style: TextStyle(color: Colors.white)),
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


// ----------------- Tile Code ----------------------------


class CustomTile extends StatelessWidget {
  final String id;
  final String dueDate;
  final String daysRemaining;
  final String amount;
  final VoidCallback onWhatsAppPressed;
  final VoidCallback onPdfPressed;
  // final void Function() ontap;

  const CustomTile({
    Key? key,
    required this.id,
    required this.dueDate,
    required this.daysRemaining,
    required this.amount,
    required this.onWhatsAppPressed,
    required this.onPdfPressed,
    // required this.ontap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  id,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Due: $dueDate  |  $daysRemaining Days',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: (){
                        GoRouter.of(context).go('/user-receivable');

                      },
                      child: Image.asset(
                        'assets/images/whatsapp.png',
                        height: 26.h,
                        width: 27.w,
                      ),
                    ),
                    SizedBox(width: 14.w),
                    GestureDetector(
                      onTap: onPdfPressed,
                      child: Image.asset(
                        'assets/images/pdfIcon.png',
                        height: 24.h,
                        width: 27.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
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
