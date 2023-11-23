import 'package:flutter/material.dart';

import 'package:trash2treasure/rquests_page.dart';
import 'package:trash2treasure/rewards_page.dart';
import 'package:trash2treasure/guidelines_page.dart';
import 'package:trash2treasure/centers_page.dart' as CentersPageAlias;
import 'package:trash2treasure/profile_page.dart';

class AfterLogin extends StatefulWidget {
  const AfterLogin({Key? key}) : super(key: key);

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  int currentPage = 4;
  List pages = [
    CentersPageAlias.InfoPage(),
    RewardsPage(),
    ProfilePage(),
    GuidelinesPage(),
    RequestsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPage,
        onDestinationSelected: (index) {
          setState(() {
            currentPage = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.location_on),
            label: 'Centers',
          ),
          NavigationDestination(
            icon: Icon(Icons.star),
            label: 'Reward',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.book),
            label: 'Guidelines',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Haraj',
          ),
        ],
      ),
    );
  }
}