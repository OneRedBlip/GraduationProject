import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Repeat Password',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Sign up logic goes here
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}

