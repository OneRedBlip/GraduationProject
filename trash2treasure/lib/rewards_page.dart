import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          RewardItem(
            storeName: 'Tamimi',
            couponValue: '100 SR',
          ),
          RewardItem(
            storeName: 'Banda',
            couponValue: '100 SR',
          ),
          RewardItem(
            storeName: 'Lulu Market',
            couponValue: '100 SR',
          ),
        ],
      ),
    );
  }
}

class RewardItem extends StatelessWidget {
  final int reward_id;
  final String reward_name;
  final String reward_desc;
  final int points_required;

  const RewardItem({
  required this.reward_id,
  required this.reward_name,
  required this.reward_desc,
  required this.points_required,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        reward_name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        reward_desc,
        style: TextStyle(fontSize: 16),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          // Collect reward logic goes here
        },
        child: Text(points_required.toString()),
      ),
    );
  }
}
