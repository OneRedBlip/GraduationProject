import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:trash2treasure/login_page.dart';
=======
import 'login_page.dart';
>>>>>>> 840aa3364c9d2f7fae1b5e68068648322c4bff0e

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
            Image.asset('assets/images/logo.png'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
