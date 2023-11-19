

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'rquests_page.dart';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

Future<http.Response> postCreds(String userName, String passWord) async {
  Map<String, dynamic> requestBody = {'username': userName, 'password': passWord};

  final response = await http.post(
    Uri(
      host: "127.1.1.1",
      port: 8000,
      scheme: "http",
    ),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestBody),
  );

  return response;
}
