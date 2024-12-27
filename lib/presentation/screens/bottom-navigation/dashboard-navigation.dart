import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/auth/signup_screen.dart';
import 'package:itax/presentation/screens/bank-and-cash-pages/add-new-bank-screen.dart';
import 'package:itax/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:itax/presentation/screens/profile/profile-screen.dart';

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AddNewBankScreen(),
    const DashboardScreen(),
    const ProfilePage(),
    const SignUpScreen(),
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
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), // Rounded corners
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 3), // Position of the shadow
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Tools',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.text_fields),
                  label: 'Blogs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more),
                  label: 'More',
                ),
              ],
              selectedItemColor:
                  Colors.blue, // Highlight color for selected item
              unselectedItemColor: Colors.grey, // Color for unselected items
              showUnselectedLabels: true, // Show labels for unselected items
              type:
                  BottomNavigationBarType.fixed, // Prevents shifting animation
              backgroundColor: Colors.white, // Ensures consistent background
            ),
          ),
        
      ),
    );
  }
}
