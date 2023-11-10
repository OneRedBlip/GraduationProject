import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:trash2treasure/login_page.dart';
import 'package:trash2treasure/requests_page.dart';
import 'package:trash2treasure/rewards_page.dart';
import 'package:trash2treasure/signup_page.dart';
import 'package:trash2treasure/user_profile_page.dart';
=======
import 'home_page.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'requests_page.dart';
import 'user_profile_page.dart';
import 'rewards_page.dart';
>>>>>>> 840aa3364c9d2f7fae1b5e68068648322c4bff0e

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
