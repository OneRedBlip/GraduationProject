import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The Green Saudi Vision 2030 is a plan by Saudi Arabia to achieve sustainable development. Recycling is a key component of this vision and is important for several reasons:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Conservation of resources: Recycling helps preserve natural resources like forests and minerals by reducing the need for raw material extraction.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Energy savings: Recycling requires less energy compared to manufacturing from scratch, leading to reduced greenhouse gas emissions.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Waste reduction: Recycling diverts waste from landfills, extending the lifespan of materials and reducing pollution.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Environmental protection: Proper waste disposal through recycling minimizes soil and water contamination and reduces harm to wildlife.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Economic benefits: Recycling creates jobs, stimulates economic growth, and promotes a circular economy.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}