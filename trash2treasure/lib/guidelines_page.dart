import 'package:flutter/material.dart';

import 'MaterialIdentificationPage.dart';

class GuidelinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guidelines'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            FilledButton.icon(
              label: Text('Is This Recyclable?'),
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
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                  'Recyclability varies across different materials, playing a crucial role in sustainable waste management. Plastics, including PET and HDPE, are commonly recyclable, and proper disposal channels facilitate their reuse. Aluminum, known for its high recycling efficiency, is a sustainable choice due to its infinite recyclability without compromising quality. Glass is another recyclable material, with the potential to be reprocessed repeatedly. However, challenges arise with certain materials like food waste, which poses contamination issues in recycling streams. Batteries, comprising hazardous materials, should not be included in regular recycling bins, as their disposal requires specialized processes to prevent environmental harm. Understanding the recyclability of materials empowers individuals to make environmentally conscious choices in their daily lives.'),
            ),
            const SizedBox(height: 8),
            TextButton(
                child: const Text('Click here for more information'),
                onPressed: () {}),
            const SizedBox(height: 24),
            const Text('Recyclable Materials',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.local_drink,
                    ), // Icon for recyclable material (e.g., plastic)
                    TextButton(
                      child: Text('Plastic'),
                      onPressed: () {},
                    ), // Label for recyclable material
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons
                        .description), // Icon for recyclable material (e.g., organic waste)
                    TextButton(
                        child: Text('Paper'),
                        onPressed: () {}), // Label for recyclable material
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons
                        .invert_colors), // Icon for recyclable material (e.g., glass)
                    TextButton(
                        child: Text('Glass'),
                        onPressed: () {}), // Label for recyclable material
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Non-Recyclable Materials',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons
                        .fastfood), // Icon for non-recyclable material (e.g., food)
                    TextButton(
                        child: Text('Food'),
                        onPressed: () {}), // Label for non-recyclable material
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons
                        .local_florist), // Icon for non-recyclable material (e.g., paper)
                    TextButton(
                        child: Text('Organic Waste'),
                        onPressed: () {}), // Label for non-recyclable material
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons
                        .battery_std), // Icon for non-recyclable material (e.g., batteries)
                    TextButton(
                        child: Text('Batteries'),
                        onPressed: () {}), // Label for non-recyclable material
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
