import 'package:flutter/material.dart';
import 'package:trash2treasure/guidelines_page.dart';
import 'package:trash2treasure/info_page.dart';
import 'package:trash2treasure/profile_page.dart';
import 'package:trash2treasure/reward_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Implement the UI for the MainPage here
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests page'),
      ),
      body: Center(
        child: Text('Welcome to the Requests page!'),
      ),
    );
  }
}

class TrashToTreasureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trash to Treasure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      routes: {
        '/info': (context) => InfoPage(),
        '/reward': (context) => RewardPage(),
        '/profile': (context) => ProfilePage(),
        '/guidelines': (context) => GuidelinesPage(),
        '/request1': (context) => RequestDetailsPage(requestId: 1),
        '/request2': (context) => RequestDetailsPage(requestId: 2),
        '/request3': (context) => RequestDetailsPage(requestId: 3),
        '/request4': (context) => RequestDetailsPage(requestId: 4),
        '/request5': (context) => RequestDetailsPage(requestId: 5),
        '/request6': (context) => RequestDetailsPage(requestId: 6),
        '/request7': (context) => RequestDetailsPage(requestId: 7),
        '/request8': (context) => RequestDetailsPage(requestId: 8),
        '/request9': (context) => RequestDetailsPage(requestId: 9),
        '/request10': (context) => RequestDetailsPage(requestId: 10),
      },
    );
  }
}

class RequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trash to Treasure'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          RequestCard(
            title: 'Plastic Bottles',
            description: 'Recyclable plastic bottles',
            onPressed: () {
            postPosts("jubail", "location");
            },
          ),
          RequestCard(
            title: 'Cardboard',
            description: 'Recyclable cardboard boxes',
            onPressed: () {
              Navigator.pushNamed(context, '/request2');
            },
          ),
          RequestCard(
            title: 'Glass Jars',
            description: 'Recyclable glass jars',
            onPressed: () {
              Navigator.pushNamed(context, '/request3');
            },
          ),
          RequestCard(
            title: 'Aluminum Cans',
            description: 'Recyclable aluminum cans',
            onPressed: () {
              Navigator.pushNamed(context, '/request4');
            },
          ),
          RequestCard(
            title: 'Paper',
            description: 'Recyclable paper',
            onPressed: () {
              Navigator.pushNamed(context, '/request5');
            },
          ),
          RequestCard(
            title: 'Plastic Bags',
            description: 'Recyclable plastic bags',
            onPressed: () {
              Navigator.pushNamed(context, '/request6');
            },
          ),
          RequestCard(
            title: 'Metal Scraps',
            description: 'Recyclable metal scraps',
            onPressed: () {
              Navigator.pushNamed(context, '/request7');
            },
          ),
          RequestCard(
            title: 'Electronics',
            description: 'Recyclable electronics',
            onPressed: () {
              Navigator.pushNamed(context, '/request8');
            },
          ),
          RequestCard(
            title: 'Tires',
            description: 'Recyclable tires',
            onPressed: () {
              Navigator.pushNamed(context, '/request9');
            },
          ),
          RequestCard(
            title: 'Batteries',
            description: 'Recyclable batteries',
            onPressed: () {
              Navigator.pushNamed(context, '/request10');
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Reward',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Guidelines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: 4, // Set the initial selected index (Home)
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RewardPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GuidelinesPage()),
              );
              break;
            case 4:
// Do nothing as we're already on the home page
              break;
          }
        },
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  RequestCard({
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        onTap: onPressed,
      ),
    );
  }
}

class RequestDetailsPage extends StatelessWidget {
  final int requestId;

  RequestDetailsPage({required this.requestId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Details'),
      ),
      body: Center(
        child: Text('Request $requestId Details'),
      ),
    );
  }
}

Future<http.Response> postPosts(String location, String searchBy) async {
  Map<String, dynamic> requestBody = {
    'location': location,
    'searchBy': searchBy
  };

  try {
    final response = await http.post(
      Uri(host: "127.1.1.1", port: 8000, scheme: "http", path: "/posts"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );
    print(response.body);
    print(response.headers);

    return response;
  } catch (error) {
    //TODO Return something better
    return http.Response(
        'An error occured while attempting to connect to server', 500);
  }
}
