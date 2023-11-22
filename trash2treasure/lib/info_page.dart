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
            SizedBox(height: 16),
            Container(
              alignment: Alignment.bottomRight,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          Text('trash2treasure@gmail.com'),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            'assets/instagram_icon.svg',
                            width: 20,
                            height: 20,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          Text('@trash2trasure'),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.language,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          Text('www.trash2treasure.com'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
