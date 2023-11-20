import 'package:flutter/material.dart';

import 'MaterialIdentificationPage.dart';

class GuidelinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guidelines'),
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              // Navigate to material identification page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MaterialIdentificationPage()),
              );
            },
            child: Icon(
              Icons.photo_camera,
              size: 48,
            ),
          ),
          SizedBox(height: 24),
          Text('Recyclable Materials', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.local_drink), // Icon for recyclable material (e.g., plastic)
                  Text('Plastic'), // Label for recyclable material
                ],
              ),
              Column(
                children: [
                  Icon(Icons.local_florist), // Icon for recyclable material (e.g., organic waste)
                  Text('Organic Waste'), // Label for recyclable material
                ],
              ),
              Column(
                children: [
                  Icon(Icons.invert_colors), // Icon for recyclable material (e.g., glass)
                  Text('Glass'), // Label for recyclable material
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          Text('Non-Recyclable Materials', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.fastfood), // Icon for non-recyclable material (e.g., food)
                  Text('Food'), // Label for non-recyclable material
                ],
              ),
              Column(
                children: [
                  Icon(Icons.description), // Icon for non-recyclable material (e.g., paper)
                  Text('Paper'), // Label for non-recyclable material
                ],
              ),
              Column(
                children: [
                  Icon(Icons.battery_unknown), // Icon for non-recyclable material (e.g., batteries)
                  Text('Batteries'), // Label for non-recyclable material
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

