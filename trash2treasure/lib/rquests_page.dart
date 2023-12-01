import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestsPage extends StatefulWidget {
  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  List<RequestCard> cardsList = [];

  @override
  void initState() {
    super.initState();
    createRequestCards();
  }

  Future<void> createRequestCards() async {
    try {
      final response = await postPosts("jubail", "location");

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        List<RequestCard> tmpCards = [];
        data.forEach((key, value) {
          tmpCards.add(
            RequestCard(
              requestTime: DateTime.fromMillisecondsSinceEpoch(
                  value['post_date'] * 1000),
              title: value['material_type'],
              description: value['additional_info'],
              onPressed: () {
                print("pressed");
              },
            ),
          );
        });
        tmpCards.sort((a, b) => b.compareTo(a));
        setState(() {
          cardsList = tmpCards;
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
        title: Text('Requests'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => {print("filterbutton")},
            icon: Icon(Icons.filter_list_rounded),
            tooltip: "Filter requests",
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: cardsList,
      ),
    );
  }
}

class RequestCard extends StatelessWidget implements Comparable {
  final String title;
  final String description;
  final DateTime requestTime;
  final VoidCallback onPressed;

  RequestCard({
    required this.title,
    required this.description,
    required this.onPressed,
    required this.requestTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        onTap: onPressed,
      ),
    );
  }

  @override
  int compareTo(other) {
    return requestTime.compareTo(other.requestTime);
  }
}

class RequestDetailsPage extends StatelessWidget {
  final int requestId;

  RequestDetailsPage({required this.requestId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Details'),
      ),
      body: Center(
        child: Text('Request $requestId Details'),
      ),
    );
  }
}

Future<http.Response> postPosts(String location, String searchBy) async {
  Map<String, dynamic> requestBody = {
    'location': location,
    'searchBy': searchBy
  };

  try {
    final response = await http.post(
      Uri(host: "127.1.1.1", port: 8000, scheme: "http", path: "/posts"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );
    print(response.body);
    print(response.headers);

    return response;
  } catch (error) {
    // for testing when not connected to server
    return http.Response(
        "{\"1\":{\"additional_info\":\"I have about 2kg of plastic bottles.\",\"location\":\"jubail\",\"material_type\":\"plastic\",\"post_date\":1700498992,\"status\":\"O\",\"user_id\":2},\"2\":{\"additional_info\":\"3kg of soda bottles. contact me for details\",\"location\":\"jubail\",\"material_type\":\"Metal\",\"post_date\":1600498992,\"status\":\"O\",\"user_id\":3}}\n",
        200);
  }
}
