import 'package:flutter/material.dart';

import 'package:trash2treasure/rquests_page.dart';
import 'package:trash2treasure/rewards_page.dart';
import 'package:trash2treasure/guidelines_page.dart';
import 'package:trash2treasure/centers_page.dart' as CentersPageAlias;
import 'package:trash2treasure/profile_page.dart';
import 'userData.dart';

class AfterLogin extends StatefulWidget {
  final UserData currentUser;
  const AfterLogin({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  @override
    void initState() {
      super.initState();
      this.widget.currentUser;
    }
  int currentPage = 4;

  @override
  Widget build(BuildContext context) {
   List pages = [
    CentersPageAlias.InfoPage(),
    RewardsPage(currentUser: widget.currentUser),
    ProfilePage(),
    GuidelinesPage(),
    RequestsPage()
  ];

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

