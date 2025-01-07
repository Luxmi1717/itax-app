import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/accounts/widgets/parties-tile-widget.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/widgets/add-cash-category.dart';
import 'package:itax/presentation/screens/more-screens/slider-widgets/add-user-slider-widget.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sales-options-slider.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/bottom-sheets/sort-by-slider-widget.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/widgets/type-1-tile.dart';
import 'package:itax/presentation/widgets/search_feild_widget.dart';

import '../../../../utility/functions.dart';

class CustomAppBarParties extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomAppBarParties({
    super.key,
    required this.tabController,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppGradients.mainGradient,
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
              Text('Parties',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              const Spacer(),
             
              IconButton(
                icon: const Icon(Icons.more_horiz, color: whiteColor),
                onPressed: () {
                  openBottomSheet(context, SalesOptionsSlider());
                },
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => onTabSelected(0),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 9.h, horizontal: 40.w),
                  decoration: BoxDecoration(
                    color:
                        selectedIndex == 0 ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Customers',
                    style: TextStyle(
                      color: selectedIndex == 0 ? mainBlueColor : Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () => onTabSelected(1),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 9.h, horizontal: 40.w),
                  decoration: BoxDecoration(
                    color:
                        selectedIndex == 1 ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Suppliers',
                    style: TextStyle(
                      color: selectedIndex == 1 ? mainBlueColor : Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('₹ 4,95,350',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold)),
                    Text('Receivables',
                        style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  ],
                ),
                Container(
                  height: 30.h,
                  width: 1.w,
                  color: Colors.white,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('₹ 5,03,650',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold)),
                    Text('Payables',
                        style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(200.h);
}

class PartiesPage extends StatefulWidget {
  const PartiesPage({super.key});

  @override
  _BankCashScreenState createState() => _BankCashScreenState();
}

class _BankCashScreenState extends State<PartiesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection(int index) {
    setState(() {
      selectedIndex = index;
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarParties(
        tabController: _tabController,
        selectedIndex: selectedIndex,
        onTabSelected: _handleTabSelection,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 15.h),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                                                    contentPadding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 16.w),
                        ),
                      ),
                    ),
                  
                SizedBox(
                    width: 10
                        .w), // Add spacing between the search field and the container
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  height: 50.h, // Same height as the search field
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(color: Colors.grey),
                    
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/sort.png', // Replace with your image asset path
                      fit: BoxFit.cover,
                      height:
                          30.h, // Ensure the image fits well within the container
                      width: 30.w,
                    ),
                  ),
                ),
                ],
                ),
              ),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                     CustomerContentWidget(),
                     SupplierContentWidget(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 50.h,
            right: 36.w,
            child: FloatingActionButton.extended(

              backgroundColor: mainBlueColor,
              onPressed: () {
                GoRouter.of(context).push('/party-create');
              },
              icon: const Icon(
                Icons.person_add,
                color: whiteColor,
              ),
              label: selectedIndex == 0
                  ? const Text(
                      'Add Party',
                      style: TextStyle(color: whiteColor),
                    )
                  : const Text(
                      'Add Party',
                      style: TextStyle(color: whiteColor),
                    ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomerContentWidget extends StatelessWidget {
  const CustomerContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomPartiesTile(
            leadingText: 'Monu Pathak',
            trailingText: '₹ 11,200',
            onTap: () {
            },
          ),
          CustomPartiesTile(
            leadingText: 'Sanjay Enterprises',
            trailingText: '₹ 3,33,200',
            onTap: () {
            },
          ),
          CustomPartiesTile(
            leadingText: 'Amit Kumar Singh',
            trailingText: '₹ 11,200',
            onTap: () {
            },
          ),
          CustomPartiesTile(
            leadingText: 'Amir Faisal',
            trailingText: '₹ 3,33,200',
            onTap: () {
            },
          ),
          CustomPartiesTile(
            leadingText: 'Pawan Kumar',
            trailingText: '₹ 3,33,200',
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}

class SupplierContentWidget extends StatelessWidget {
  const SupplierContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomPartiesTile(
            leadingText: 'Monu Pathak',
            trailingText: '₹ 11,200',
            onTap: () {},
          ),
          CustomPartiesTile(
            leadingText: 'Sanjay Enterprises',
            trailingText: '₹ 3,33,200',
            onTap: () {},
          ),
          CustomPartiesTile(
            leadingText: 'Amit Kumar Singh',
            trailingText: '₹ 11,200',
            onTap: () {},
          ),
          CustomPartiesTile(
            leadingText: 'Amir Faisal',
            trailingText: '₹ 3,33,200',
            onTap: () {},
          ),
          CustomPartiesTile(
            leadingText: 'Pawan Kumar',
            trailingText: '₹ 3,33,200',
            onTap: () {},
          ),

        ],
      ),
    );
  }
}

