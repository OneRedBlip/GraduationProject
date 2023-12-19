import 'package:flutter/material.dart';
import 'userData.dart';
import 'package:url_launcher/url_launcher.dart';

class CentersPage extends StatelessWidget {
  final UserData currentUser;

  const CentersPage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    var centersList = [
      CenterCard(
        name: "Clothes Bin",
        points: 180,
        material: "Fabric",
        distance: 1.52,
        onTap: () {
          print("we Clicked");
        },
      ),
      CenterCard(
        name: "Paper Bin",
        points: 80,
        material: "Paper",
        distance: 1.12,
        onTap: () {
          print("we Clicked");
        },
      ),
      CenterCard(
        name: "ResCo Plastics",
        points: 220,
        material: "Plastic",
        distance: 3.12,
        onTap: () {
          print("we Clicked");
        },
      ),
      CenterCard(
        name: "EcoCycle",
        points: 190,
        material: "Iron",
        distance: 4.03,
        onTap: () {
          print("we Clicked");
        },
      ),
      CenterCard(
        name: "Metal Marvels",
        points: 100,
        material: "Steel",
        distance: 5.22,
        onTap: () {
          print("we Clicked");
        },
      ),
      CenterCard(
        name: "Green Glass",
        points: 75,
        material: "Glass",
        distance: 3.02,
        onTap: () {
          print("we Clicked");
        },
      ),
      CenterCard(
        name: "Plastics Bin",
        points: 40,
        material: "Plastic",
        distance: 20.82,
        onTap: () {
          print("we Clicked");
        },
      ),
      CenterCard(
        name: "Green Circuits",
        points: 140,
        material: "E-Waste",
        distance: 26.33,
        onTap: () {
          openGoogleMaps(27.1421476, 49.4040448);
        },
      ),
      CenterCard(
        name: "PaperPulse",
        points: 70,
        material: "Paper",
        distance: 22.12,
        onTap: () {
          print("we Clicked");
        },
      ),
    ];
    centersList.sort();
    return Scaffold(
      appBar: AppBar(
        title: Text('Centers'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: centersList,
      ),
    );
  }
}

class CenterCard extends StatelessWidget implements Comparable {
  final String material;
  final String name;
  final double distance;
  final int points;
  final VoidCallback onTap;

  const CenterCard(
      {super.key,
      required this.material,
      required this.name,
      required this.distance,
      required this.points,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
        leading: SizedBox(
          child: Text(
            material,
            textAlign: TextAlign.start,
          ),
          width: 64,
        ),
        contentPadding: const EdgeInsets.all(6),
        title: Text(name),
        subtitle: Text('$points pts'),
        trailing: Text('$distance Km'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: const Text('Center Details'),
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: ListView(
                      children: [
                        Text(
                          'Center Name: $name',
                        ),
                        Text(
                          'Material: $material',
                        ),
                        Text(
                          'Points: $points',
                        ),
                        const Text(
                          'Hours: Sun - Thu. 8 AM - 2 PM',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 46, right: 46),
                          child: FilledButton.icon(
                            onPressed: () =>
                                {openGoogleMaps(27.1421476, 49.4040448)},
                            icon: const Icon(Icons.navigation),
                            label: Text(distance.toString() + ' Km'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  int compareTo(other) {
    return distance.compareTo(other.distance);
  }
}

void openGoogleMaps(double latitude, double longitude) async {
  try {
    Uri googleMapsUri = Uri(
        scheme: 'https',
        host: 'google.com',
        path: 'maps/search/?api=1&query=$latitude,$longitude');

    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri);
    }
  } catch (error) {
    print(error);
  }
}
