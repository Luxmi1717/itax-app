import 'package:flutter/material.dart';
import 'package:itax/presentation/screens/accounts/account-dashboard-screen.dart';
import 'package:itax/presentation/screens/accounts/parties/parties-screen.dart';
import 'package:itax/presentation/screens/more-screens/more-screen.dart';
import 'package:itax/presentation/screens/profile/profile-screen.dart';

class AccountsBottomBar extends StatefulWidget {
  const AccountsBottomBar({super.key});

  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<AccountsBottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AccountDashboard(),
    const PartiesPage(),
    const ProfilePage(),
    const ProfilePage(),
    const MoreScreen(),
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
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)), // Rounded corners
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
                icon: Icon(Icons.people),
                label: 'Parties',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Items',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.graphic_eq),
                label: 'Reports',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.block),
                label: 'More',
              ),
            ],
            selectedItemColor: Colors.blue, // Highlight color for selected item
            unselectedItemColor: Colors.grey, // Color for unselected items
            showUnselectedLabels: true, // Show labels for unselected items
            type: BottomNavigationBarType.fixed, // Prevents shifting animation
            backgroundColor: Colors.white, // Ensures consistent background
          ),
        ),
      ),
    );
  }
}
