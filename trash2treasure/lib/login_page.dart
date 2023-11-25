import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trash2treasure/signup_page.dart';

import 'AfterLogin.dart';
import 'userData.dart';

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
            onPressed: () async {
              // Check login credentials here
              String username = emailController.text;
              String password = passwordController.text;
              http.Response response = await postCreds(username, password);
              Map<String, dynamic>? responseJson;
              if (response.statusCode == 200) {
                responseJson = jsonDecode(response.body);
              }
              String originalCookie = response.headers['set-cookie'] ?? ';';
              String rawCookie =
                  originalCookie.substring(0, originalCookie.indexOf(";"));

              UserData currentUserInfo =
                  UserData.fromJson(responseJson, rawCookie);

              if ((username == 'testuser' && password == '123') ||
                  response.statusCode == 200) {
                // Navigate to MainPage if login is successful
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AfterLogin(
                            currentUser: currentUserInfo,
                          )),
                );
              } else {
                // Handle invalid login credentials
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupPage()));
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
  Map<String, dynamic> requestBody = {
    'user_name': userName,
    'password': passWord
  };

  try {
    final response = await http.post(
      Uri(host: "127.1.1.1", port: 8000, scheme: "http", path: "/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );

    return response;
  } catch (error) {
    //TODO Return something better
    return http.Response(
        'An error occured while attempting to connect to server', 500);
  }
}
