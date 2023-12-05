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
        name: "Center one!",
        points: 90,
        material: "Plastic",
        distance: 2.25,
        onTap: () {
          print("we Clicked");
        },
      ),
      CenterCard(
        name: "Center two!",
        points: 130,
        material: "Metal",
        distance: 1.12,
        onTap: () {
          print("we Clicked");
        },
      ),
      CenterCard(
        name: "Center Last!!!!",
        points: 1234,
        material: "Food",
        distance: 14.125,
        onTap: () {
          openGoogleMaps(27.1421476, 49.4040448);
        },
      )
    ];
    centersList.sort();
    return Scaffold(
      appBar: AppBar(
        title: Text('Centers'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: centersList,
        ),
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
        leading: Text(material),
        title: Text(name),
        subtitle: Text('$points pts'),
        trailing: Text('$distance Km'),
        onTap: onTap,
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
