import 'package:flutter/material.dart';
import 'package:trash2treasure/guidelines_page.dart';
import 'package:trash2treasure/info_page.dart';
import 'package:trash2treasure/profile_page.dart';
import 'package:trash2treasure/reward_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'haraj_page.dart';

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
        '/haraj': (context) => HarajPage(),
      },
    );
  }
}

class RequestsPage extends StatefulWidget {
  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  List<RequestCard> cardsList = [];

  @override
  void initState() {
    super.initState();
    createRequestCards();
  }

  Future<void> createRequestCards() async {
    try {
      final response = await postPosts("jubail", "location");

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        List<RequestCard> tmpCards = [];
        data.forEach((key, value) {
          tmpCards.add(
            RequestCard(
              title: value['material_type'],
              description: value['additional_info'],
              onPressed: () {
                print("pressed");
              },
            ),
          );
        });
        setState(() {
          cardsList = tmpCards;
        });
      } else {
        print('Error $response');
      }
    } catch (error) {
      print('we got error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trash to Treasure'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: cardsList,
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
            label: 'Haraj',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: 4, // Set the initial selected index (Haraj)
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => InfoPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RewardPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfilePage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => GuidelinesPage()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HarajPage()),
              );
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
    // for testing when not connected to server
    return http.Response(
        "{\"1\":{\"additional_info\":\"I have about 2kg of plastic bottles.\",\"location\":\"jubail\",\"material_type\":\"plastic\",\"post_date\":1700498992,\"status\":\"O\",\"user_id\":2},\"2\":{\"additional_info\":\"3kg of soda bottles. contact me for details\",\"location\":\"jubail\",\"material_type\":\"Metal\",\"post_date\":1600498992,\"status\":\"O\",\"user_id\":3}}\n",
        200);
  }
}
