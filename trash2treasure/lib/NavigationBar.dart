import 'package:flutter/material.dart';
class NavigationBar extends StatelessWidget {
  final String currentPage;

  NavigationBar({required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _getPageIndex(currentPage),
      onTap: (index) {
        _navigateToPage(context, index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.redeem),
          label: 'Rewards',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          label: ' Haraj', // New item
        ),
      ],
    );
  }

// Rest of the code...
}

void _navigateToPage(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/');
      break;
    case 1:
      Navigator.pushNamed(context, '/info');
      break;
    case 2:
      Navigator.pushNamed(context, '/reward');
      break;
    case 3:
      Navigator.pushNamed(context, '/profile');
      break;
    case 4:
      Navigator.pushNamed(context, '/haraj'); // New case
      break;
  }
}

int _getPageIndex(String page) {
  switch (page) {
    case '/':
      return 0;
    case '/info':
      return 1;
    case '/reward':
      return 2;
    case '/profile':
      return 3;
    case '/haraj': // New case
      return 4;
    default:
      return 0;
  }
}