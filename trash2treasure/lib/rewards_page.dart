import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RewardsPage extends StatefulWidget {
  final String myCooke;
  const RewardsPage ({Key? key, required this.myCooke}) : super(key: key);
  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  List<RewardCard> rewardsList = [];

  @override
  void initState() {
    super.initState();
    createRewardsCards();
    widget.myCooke;
  }

  Future<void> createRewardsCards() async {
    print("we here" + widget.myCooke);
    try {
      final response = await getRewards(widget.myCooke);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        List<RewardCard> tmpCards = [];
        data.forEach((key, value) {
          tmpCards.add(
            RewardCard(
              reward_id: int.parse(key.toString()),
              reward_name: value['reward_name'],
              reward_desc: value['reward_desc'],
              points_required: value['points_required'],
              onPressed: () {
              postReward(key, widget.myCooke);
              },
            ),
          );
        });
        setState(() {
          rewardsList = tmpCards;
        });
      } else {
        print('Error $response');
      }
    } catch (error) {
      print('we got error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: rewardsList,
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final int reward_id;
  final String reward_name;
  final String reward_desc;
  final int points_required;
  final VoidCallback onPressed;

  const RewardCard({
    required this.reward_id,
    required this.reward_name,
    required this.reward_desc,
    required this.points_required,
    required this.onPressed,
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
        onPressed: onPressed,
        child: Text(points_required.toString() + ' Pts'),
      ),
    );
  }
}

Future<http.Response> getRewards(String cookie) async {
  try {
    final response = await http.post(
      Uri(host: "127.1.1.1", port: 8000, scheme: "http", path: "/rewards"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'cookie': cookie,
      },
    );
    print(response.body);
    print(response.headers);

    return response;
  } catch (error) {
    // for testing when not connected to server
    return http.Response('{"1":{"points_required":550,"reward_desc":"Coupon Value: 100 SR","reward_id":1,"reward_name":"Tamimi"},"2":{"points_required":550,"reward_desc":"Coupon Value: 100 SR","reward_id":2,"reward_name":"Panda"},"3":{"points_required":550,"reward_desc":"Coupon Value: 100 SR","reward_id":3,"reward_name":"Lulu hypermarket"},"4":{"points_required":75,"reward_desc":"Coupon Value: 25 SR","reward_id":4,"reward_name":"HungerStation"}}', 200);
  }
}

Future<http.Response> postReward(String reward_id, String cookie) async {
  Map<String, dynamic> requestBody = {'reward_id': reward_id};

  try {
    final response = await http.post(
      Uri(
        host: "127.1.1.1",
        port: 8000,
        scheme: "http",
        path: "/redeemreward"
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'cookie': cookie,
      },
      body: jsonEncode(requestBody),
    );

    return response;
  }
  catch (error) {
    //TODO Return something better
    return http.Response('An error occured while attempting to connect to server', 500);
  }
}
