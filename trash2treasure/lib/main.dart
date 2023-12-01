import 'package:flutter/material.dart';

import 'package:trash2treasure/login_page.dart';

void main() {
  runApp(TrashToTreasureApp());
}

class TrashToTreasureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trash to Treasure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trash to Treasure'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/unnamed.png',
              width: 200,
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
