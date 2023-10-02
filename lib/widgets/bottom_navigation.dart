// CustomBottomNavigation.dart

import 'package:flutter/material.dart';
import 'package:goalup/screens/target.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabTap;
  final VoidCallback onSearch;
  final VoidCallback onAdd;
  final Color? backgroundColor;

  CustomBottomNavigation({
    required this.currentIndex,
    required this.onTabTap,
    required this.onSearch,
    required this.onAdd,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: backgroundColor,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(color: Colors.black),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on), // Target icon
          label: 'Target',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
      ],
      onTap: (index) {
        if (index == 1) {
          onSearch();
        } else if (index == 2) {
          Navigator.pushNamed(context, '/target');
          
          onTabTap(index);
        } else if (index == 3) {
          // Invoke the add action
          onAdd();
        } else {
          onTabTap(index);
        }
      },
    );
  }
}
