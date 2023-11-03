import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 2,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _username,
                    decoration: InputDecoration(hintText: "User name"),
                  ),
                  TextField(
                    autocorrect: false,
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () => {print(_password)},
                          child: Text("Reset Password")),
                      TextButton(
                          onPressed: () => {
                                sendToServer(_username.text, _password.text),
                                if (_password.text == "123")
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => FancyHomeScreen()))
                                  }
                              },
                          child: Text("Login"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Future<http.Response> sendToServer(String data) {
//   return http
//       .post(Uri(host: "127.1.1.1", port: 8000, scheme: "http"), headers: <String, String>{
//     'Content-Type': 'application/json; charset=UTF-8'
//   }, body: <String, String>{
//     'data': jsonEncode(data),
//   });
// }

Future<http.Response> sendToServer(String userName, String passWord) async {
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
