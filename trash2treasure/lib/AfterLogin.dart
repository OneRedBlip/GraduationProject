import 'package:flutter/material.dart';

import 'package:trash2treasure/rquests_page.dart';
import 'package:trash2treasure/rewards_page.dart';
import 'package:trash2treasure/signup_page.dart';
import 'package:trash2treasure/user_profile_page.dart';

import 'package:trash2treasure/guidelines_page.dart';
import 'package:trash2treasure/info_page.dart';
import 'package:trash2treasure/profile_page.dart';
import 'package:trash2treasure/reward_page.dart';
import 'package:trash2treasure/haraj_page.dart';

class AfterLogin extends StatefulWidget {
  const AfterLogin({super.key});

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  int currentPage = 4;
  List pages = [
    InfoPage(),
    RewardPage(),
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
            icon: Icon(Icons.info),
            label: 'About Us', // Change the label to 'About Us'
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
            icon: Icon(Icons.shopping_cart), // Replace with the desired icon
            label: 'Haraj',
          ),
        ],
      ),
    );
  }
}
