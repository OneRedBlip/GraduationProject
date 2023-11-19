import 'package:flutter/material.dart';


void main() {
  runApp(TrashToTreasureApp());
}


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
            title: 'Request 1',
            description: 'Description of Request 1',
            onPressed: () {
              Navigator.pushNamed(context, '/request1');
            },
          ),
          RequestCard(
            title: 'Request 2',
            description: 'Description of Request 2',
            onPressed: () {
              Navigator.pushNamed(context, '/request2');
            },
          ),
          RequestCard(
            title: 'Request 3',
            description: 'Description of Request 3',
            onPressed: () {
              Navigator.pushNamed(context, '/request3');
            },
          ),
          RequestCard(
            title: 'Request 4',
            description: 'Description of Request 4',
            onPressed: () {
              Navigator.pushNamed(context, '/request4');
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
              Navigator.pushNamed(context, '/info');
              break;
            case 1:
              Navigator.pushNamed(context, '/reward');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
            case 3:
              Navigator.pushNamed(context, '/guidelines');
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

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Center(
        child: Text('Information page content'),
      ),
    );
  }
}

class RewardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'You have earned 100 points!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Redeem rewards logic goes here
              },
              child: Text('Redeem Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Profile page content'),
      ),
    );
  }
}

class GuidelinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guidelines'),
      ),
      body: Center(
        child: Text('Guidelines page content'),
      ),
    );
  }
}