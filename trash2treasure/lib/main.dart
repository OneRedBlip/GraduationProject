import 'package:flutter/material.dart';

void main() {
  runApp(TrashToTreasureApp());
}

class TrashToTreasureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trash to Treasure',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/requests': (context) => RequestsPage(),
        '/profile': (context) => UserProfilePage(),
        '/recycle-info': (context) => RecycleInfoPage(),
        '/rewards': (context) => RewardsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trash to Treasure'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/unnamed.png'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Repeat Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Sign up logic
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
      ),
      body: Center(
        child: Text('Requests Page'),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextButton(
              onPressed: () {
                // Forgot password logic
              },
              child: Text('Forgot my password'),
            ),
            ElevatedButton(
              onPressed: () {
                // Login logic
              },
              child: Text('Enter'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Sign up'),
            ),
            TextButton(
              onPressed: () {
                // Help and support logic
              },
              child: Text('Help and Support'),
            ),
          ],
        ),
      ),
    );
  }
}



class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              // Add logic to display user's profile photo
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to change user's photo
              },
              child: Text('Change Photo'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to change username
              },
              child: Text('Change Username'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to change phone number
              },
              child: Text('Change Phone Number'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: Icon(Icons.person),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/recycle-info');
              },
              icon: Icon(Icons.info),
            ),
          ],
        ),
      ),
    );
  }
}

class RecycleInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycle Information'),
      ),
      body: Center(
        child: Text('Display recycling information here'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: Icon(Icons.person),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/recycle-info');
              },
              icon: Icon(Icons.info),
            ),
          ],
        ),
      ),
    );
  }
}

class RewardsPage extends StatelessWidget {
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
            Text('Points: 1500'),
            // Add rewards and incentives UI
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

