import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person), // Icon for user profile
                SizedBox(width: 8),
                Text(
                  'My Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          // Edit profile action
                        },
                        icon: Icon(Icons.edit), // Icon for edit action
                        label: Text('Edit'),
                      ),
                    ],
                  ),
                  Text('Full Name: John Doe'),
                  Text('Email: johndoe@example.com'),
                  Text('Phone Number: 123-456-7890'),
                  Text('City: New York'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}