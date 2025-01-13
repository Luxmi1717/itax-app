import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itax/presentation/screens/accounts/account-dashboard-screen.dart';
import 'package:itax/presentation/screens/accounts/items/items-all-screen.dart';
import 'package:itax/presentation/screens/accounts/parties/parties-screen.dart';
import 'package:itax/presentation/screens/accounts/reports/reports-main-screen.dart';
import 'package:itax/presentation/screens/home-dashboard/dashboard_screen.dart';
import 'package:itax/presentation/screens/more-screens/more-screen.dart';
import 'package:itax/presentation/screens/profile/profile-screen.dart';

class AccountsBottomBar extends StatefulWidget {
  const AccountsBottomBar({super.key});

  @override
  _BottomNavBarDashBoardState createState() => _BottomNavBarDashBoardState();
}

class _BottomNavBarDashBoardState extends State<AccountsBottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AccountDashboard(),
    const PartiesPage(),
    const AllItemsScreen(),
    const ReportsBasePage(),
    const MoreScreen()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: _currentIndex == 0
                      ? Colors.blue.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SvgPicture.asset(
                  'assets/itax-icons/accounts-icons/home.svg',
                  height: 22.h,
                  width: 22.w,
                  color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: _currentIndex == 1
                      ? Colors.blue.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SvgPicture.asset(
                  'assets/itax-icons/accounts-icons/parties.svg',
                  height: 22.h,
                  width: 22.w,
                  color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                ),
              ),
              label: 'Parties',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: _currentIndex == 2
                      ? Colors.blue.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SvgPicture.asset(
                  'assets/itax-icons/accounts-icons/items.svg',
                  height: 22.h,
                  width: 22.w,
                  color: _currentIndex == 2 ? Colors.blue : Colors.grey,
                ),
              ),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: _currentIndex == 3
                      ? Colors.blue.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SvgPicture.asset(
                  'assets/itax-icons/accounts-icons/Reports.svg',
                  height: 22.h,
                  width: 22.w,
                  color: _currentIndex == 3 ? Colors.blue : Colors.grey,
                ),
              ),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: _currentIndex == 4
                      ? Colors.blue.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SvgPicture.asset(
                  'assets/itax-icons/accounts-icons/more.svg',
                  height: 22.h,
                  width: 22.w,
                  color: _currentIndex == 4 ? Colors.blue : Colors.grey,
                ),
              ),
              label: 'More',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12.sp,
          ),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0, // Removes default shadow
        ),
      ),
    );
  }
}
