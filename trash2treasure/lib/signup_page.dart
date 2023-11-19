import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController  = TextEditingController();
  final TextEditingController passwordRepeatController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
          controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          TextField(
            controller: passwordRepeatController,
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

