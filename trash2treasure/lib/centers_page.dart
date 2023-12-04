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
          crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget _buildRecycleCenterBox({required String cityName, required String imagePath}) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              cityName,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
