import 'package:flutter/material.dart';

class CentersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centers'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Recycle Centers in Saudi',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Recycling Centers:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRecycleCenterBox(
                  cityName: 'Dammam',
                  imagePath: 'assets/dammam_map.png',
                ),
                _buildRecycleCenterBox(
                  cityName: 'Riyadh',
                  imagePath: 'assets/riyadh_map.png',
                ),
                _buildRecycleCenterBox(
                  cityName: 'Jeddah',
                  imagePath: 'assets/jeddah_map.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}

class CenterCard extends StatelessWidget {
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
    return ListTile(
      leading: Text(material),
      title: Text(name),
      subtitle: Text('$points pts'),
      trailing: Text('$distance Km'),
      onTap: onTap,
    );
  }
}
