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
  String? newPostMaterial;
  String? newPostCity;

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
              phoneNum: value['phone_num'],
              userName: value['user_name'],
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

  Future<void> _showInputPopup() async {
    final double screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String newRequestDetails = '';
    return showDialog<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Enter Request Details'),
            content: Container(
              height: screenHeight * 0.30,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            hint: Text('Material'),
                            value: newPostMaterial,
                            items: [
                              DropdownMenuItem(
                                child: Text('Metal'),
                                value: 'Metal',
                              ),
                              DropdownMenuItem(
                                child: Text('Plastic'),
                                value: 'Plastic',
                              ),
                              DropdownMenuItem(
                                child: Text('Food'),
                                value: 'Food',
                              ),
                              DropdownMenuItem(
                                child: Text('Paper'),
                                value: 'Paper',
                              ),
                              DropdownMenuItem(
                                child: Text('Glass'),
                                value: 'Glass',
                              ),
                              DropdownMenuItem(
                                child: Text('Other'),
                                value: 'Other',
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                newPostMaterial = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            hint: Text('City'),
                            value: newPostCity,
                            items: [
                              DropdownMenuItem(
                                child: Text('Dammam'),
                                value: 'Dammam',
                              ),
                              DropdownMenuItem(
                                child: Text('Jubail'),
                                value: 'Jubail',
                              ),
                              DropdownMenuItem(
                                  child: Text('Riyadh'), value: 'Riyadh'),
                            ],
                            onChanged: (value) {
                              setState(() {
                                newPostCity = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: 'Request Details',
                        ),
                        onChanged: (value) => newRequestDetails = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter the request details.';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => {
                  if (formKey.currentState!.validate())
                    {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Request Created successfully'))),
                      postNewPost(widget.currentUser.sessionCookie, newPostCity,
                          newPostMaterial, newRequestDetails),
                      Navigator.pop(context)
                    }
                },
                child: Text('Submit'),
              ),
            ],
          );
        });
      },
    );
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showInputPopup,
        label: Text("Create Request"),
        icon: Icon(Icons.add),
      ),
    );
  }
}

class RequestCard extends StatelessWidget implements Comparable {
  final String title;
  final String description;
  final DateTime requestTime;
  final String location;
  final int phoneNum;
  final String userName;

  RequestCard({
    required this.title,
    required this.description,
    required this.requestTime,
    required this.location,
    required this.phoneNum,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: const Text('Request Details'),
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  const Icon(Icons.person),
                                  Text(
                                    userName,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  const Icon(Icons.access_time),
                                  Text(requestTime.year.toString() +
                                      '-' +
                                      requestTime.month.toString() +
                                      '-' +
                                      requestTime.day.toString())
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Material: $title',
                        ),
                        Text(
                          'Location: $location',
                        ),
                        Text(
                          'Description: $description',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 42, right: 42),
                          child: FilledButton.icon(
                            onPressed: () => {},
                            icon: const Icon(Icons.phone),
                            label: Text(phoneNum.toString()),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
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

Future<http.Response> postNewPost(String cookie, String? location,
    String? materialType, String additionalInfo) async {
  Map<String, dynamic> requestBody = {
    'location': location,
    'material_type': materialType,
    'additional_info': additionalInfo,
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
