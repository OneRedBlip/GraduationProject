import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController =
      TextEditingController();
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
            controller: phoneNumberController,
            decoration: InputDecoration(
              labelText: 'phone number',
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
            onPressed: () async {
              String username = usernameController.text;
              String email = emailController.text;
              String phoneNumber = phoneNumberController.text;
              String password = passwordController.text;
              String passwordRepeat = passwordRepeatController.text;

              http.Response response =
                  await postSignup(username, email, password, passwordRepeat);
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}

Future<http.Response> postSignup(String userName, String email, String password,
    String passwordRepeat) async {
  Map<String, dynamic> requestBody = {
    'user_name': userName,
    'email': email,
    'passwordRepeat': passwordRepeat,
    'password': password
  };

  try {
    final response = await http.post(
      Uri(host: "127.1.1.1", port: 8000, scheme: "http", path: "/signup"),
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
