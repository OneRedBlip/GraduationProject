import 'package:flutter/material.dart';

import 'MaterialIdentificationPage.dart';

class GuidelinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guidelines'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          FilledButton.icon(
            label: Text('Is this recyclable?'),
            onPressed: () {
              // Navigate to material identification page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MaterialIdentificationPage()),
              );
            },
            icon: const Icon(
              Icons.photo_camera,
            ),
          ),
          const SizedBox(height: 24),
          const Text('Recyclable Materials', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Row(
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
          const SizedBox(height: 24),
          const Text('Non-Recyclable Materials', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Row(
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

