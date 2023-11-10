

import 'dart:developer';

import 'package:flutter/material.dart';

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
            controller:emailController ,

            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: passwordController ,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () {
             log(emailController.text);
            },
            child: Text('Login'),
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