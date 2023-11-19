

import 'dart:developer';

import 'package:flutter/material.dart';

import 'rquests_page.dart';
class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: emailController,

            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            child: Text('Login'),
            onPressed: () {
              // Check login credentials here
              String username = emailController.text;
              String password = passwordController.text;

              // TODO: Actually authenticate with server
              if (username == 'testuser' && password == '123') {
                // Navigate to MainPage if login is successful
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RequestsPage()),
                );
              } else {
                // Handle invalid login credentials
                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(
                        title: Text('Invalid Login'),
                        content: Text('Please enter valid credentials.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                );
              }
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            child: Text('Sign Up'),
          ),
          TextButton(
            onPressed: () {
              // Help/Support logic goes here
            },
            child: Text('Help/Support'),
          ),
        ],
      ),
    );
  }
}

