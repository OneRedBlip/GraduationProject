import 'package:flutter/material.dart';

class RewardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'You have earned 100 points!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Redeem rewards logic goes here
              },
              child: Text('Redeem Now'),
            ),
          ],
        ),
      ),
    );
  }
}

