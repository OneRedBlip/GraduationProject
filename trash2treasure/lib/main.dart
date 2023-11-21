import 'package:flutter/material.dart';

import 'package:trash2treasure/login_page.dart';
import 'package:trash2treasure/rquests_page.dart';
import 'package:trash2treasure/rewards_page.dart';
import 'package:trash2treasure/rquests_page.dart';
import 'package:trash2treasure/signup_page.dart';
import 'package:trash2treasure/user_profile_page.dart';

import 'package:trash2treasure/guidelines_page.dart';
import 'package:trash2treasure/info_page.dart';
import 'package:trash2treasure/profile_page.dart';
import 'package:trash2treasure/reward_page.dart';
import 'package:trash2treasure/haraj_page.dart';



void main() {
  runApp(TrashToTreasureApp());
}

class TrashToTreasureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trash to Treasure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/requests': (context) => RequestsPage(),
        '/profile': (context) => UserProfilePage(),
        '/rewards': (context) => RewardsPage(),

      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trash to Treasure'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/unnamed.png',
              width: 200,
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
