import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(CoolDemoApp());
}

class CoolDemoApp extends StatelessWidget {
  const CoolDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}

class FancyHomeScreen extends StatefulWidget {
  const FancyHomeScreen({super.key});

  @override
  State<FancyHomeScreen> createState() => _FancyHomeScreenState();
}

class _FancyHomeScreenState extends State<FancyHomeScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("this is the title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("First item!"),
              Icon(Icons.add),
              Text("$count"),
              const Text("Last item!"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
          setState(() {
                      count++;
                    });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.api),
              label: "diamond",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attractions),
              label: "attractions",
            )
          ],
          onTap: (value) {
            switch (value) {
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DiamondPage(),
                  ),
                );
                break;
              case 2:
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginPage()));
              default:
            }
          },
        ),
        drawer: const Drawer(
          child: Text(
            "Hello!",
            textScaleFactor: 2.5,
          ),
        ),
      ),
    );
  }
}

void clicktyclick() {
  print("This is the function!");
}

class DiamondPage extends StatelessWidget {
  const DiamondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: (const Text("This is the diamond page.")),
        ),
        body: Center(
            child: IconButton.filled(
                iconSize: 50,
                onPressed: () => {Navigator.pop(context)},
                icon: const Icon(Icons.arrow_back))),
      ),
    );
  }
}
