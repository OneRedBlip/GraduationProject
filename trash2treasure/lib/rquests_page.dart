import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'userData.dart';

class RequestsPage extends StatefulWidget {
  final UserData currentUser;

  const RequestsPage({super.key, required this.currentUser});
  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  List<RequestCard> cardsList = [];
  String filterLocaion = "";

  @override
  void initState() {
    super.initState();
    this.widget.currentUser;
    this.filterLocaion = this.widget.currentUser.location;
    createRequestCards(widget.currentUser.location);
  }

  Future<void> createRequestCards(String location) async {
    try {
      final response = await postPosts(location, "location");

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
              location: value['location'],
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
          PopupMenuButton(
            initialValue: filterLocaion,
            icon: Icon(Icons.filter_list_rounded),
            tooltip: "Filter requests",
            onSelected: (choice) {
              createRequestCards(choice);
              setState(() {
                filterLocaion = choice;
              });
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: "Dammam",
                  child: Text("Dammam"),
                ),
                const PopupMenuItem(
                  value: "Jubail",
                  child: Text("Jubail"),
                ),
                const PopupMenuItem(
                  value: "Riyadh",
                  child: Text("Riyadh"),
                ),
              ];
            },
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
  final String location;

  RequestCard({
    required this.title,
    required this.description,
    required this.onPressed,
    required this.requestTime,
    required this.location,
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

Future<http.Response> postNewPost(String cookie, String location,
    String materialType, String additionalInfo) async {
  Map<String, dynamic> requestBody = {
    'location': location,
    'material_type': materialType,
    'additional_info': additionalInfo,
    'post_date': (DateTime.now().millisecondsSinceEpoch ~/ 1000)
  };

  try {
    final response = await http.post(
      Uri(host: "127.1.1.1", port: 8000, scheme: "http", path: "/newpost"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'cookie': cookie,
      },
      body: jsonEncode(requestBody),
    );

    return response;
  } catch (error) {
    //TODO Return something better
    return http.Response(
        'An error occured while attempting to connect to server', 500);
  }
}
