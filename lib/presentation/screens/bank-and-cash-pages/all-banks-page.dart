import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/presentation/screens/sales-purchase-screens/type-1-tile.dart';

class CustomAppBarBank extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomAppBarBank({super.key, 
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
                  Navigator.of(context).pop();
                },
              ),
              Text('Bank & Cash',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search, color: whiteColor),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.sort, color: whiteColor),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz, color: whiteColor),
                onPressed: () {},
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
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color:
                        selectedIndex == 0 ? Colors.white : Colors.transparent,
                   
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Bank',
                    style: TextStyle(
                      color: selectedIndex == 0 ? Colors.black : Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),

              GestureDetector(
                onTap: () => onTabSelected(1),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color:
                        selectedIndex == 1 ? Colors.white : Colors.transparent,
                    
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Cash',
                    style: TextStyle(
                      color: selectedIndex == 1 ? Colors.black : Colors.white,
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
                    Text('\$1000', style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    Text('Bank Balance', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                    
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('\$500', style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    Text('Cash',  style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                    
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

class AllBanksPage extends StatefulWidget {
  const AllBanksPage({super.key});

  @override
  _BankCashScreenState createState() => _BankCashScreenState();
}

class _BankCashScreenState extends State<AllBanksPage>
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: mainBlueColor,
        onPressed: () {},
        icon: const Icon(Icons.add, color: whiteColor,),
        label: selectedIndex == 0 ? const Text('Add New Bank', style: TextStyle(color: whiteColor),): const Text('Add Category', style: TextStyle(color: whiteColor),
              ),
      ),
      appBar: CustomAppBarBank(
        tabController: _tabController,
        selectedIndex: selectedIndex,
        onTabSelected: _handleTabSelection,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Expanded(child: BankContentWidget()),
          Expanded(child: CashContentWidget()),
        ],
      ),
    );
  }
}

class BankContentWidget extends StatelessWidget {
  const BankContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TileTypeOne(leadingText: 'Nov 24', trailingText: '₹ 11,200'),
          TileTypeOne(leadingText: 'Dec 24', trailingText: '₹ 3,33,200'),
          TileTypeOne(leadingText: 'Jan 23', trailingText: '₹ 11,200'),
        ],
      ),
    );
    
  }
}

class CashContentWidget extends StatelessWidget {
  const CashContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TileTypeOne(leadingText: 'Cash in Office', trailingText: '₹ 11,200'),
          TileTypeOne(leadingText: 'Cash in Home', trailingText: '₹ 3,33,200'),
        ],
      ),
    );
    
  }
}