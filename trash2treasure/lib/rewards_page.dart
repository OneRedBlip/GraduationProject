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
  final String storeName;
  final String couponValue;

  const RewardItem({
    required this.storeName,
    required this.couponValue,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        storeName,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Coupon Value: $couponValue',
        style: TextStyle(fontSize: 16),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          // Collect reward logic goes here
        },
        child: Text('Collect'),
      ),
    );
  }
}