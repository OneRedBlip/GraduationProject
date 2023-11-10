

import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Change photo logic goes here
              },
              child: Text('Change Photo'),
            ),
            ElevatedButton(
              onPressed: () {
                // Change username logic goes here
              },
              child: Text('Change Username'),
            ),
            ElevatedButton(
              onPressed: () {
                // Change phone number logic goes here
              },
              child: Text('Change Phone Number'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}