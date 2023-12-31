import 'package:flutter/material.dart';
import 'userData.dart';
import 'package:trash2treasure/login_page.dart';
import 'package:flutter_svg/svg.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'The Green Saudi Vision 2030 is a plan by Saudi Arabia to achieve sustainable development. Recycling is a key component of this vision and is important for several reasons:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Conservation of resources: Recycling helps preserve natural resources like forests and minerals by reducing the need for raw material extraction.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              'Energy savings: Recycling requires less energy compared to manufacturing from scratch, leading to reduced greenhouse gas emissions.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              'Waste reduction: Recycling diverts waste from landfills, extending the lifespan of materials and reducing pollution.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              'Environmental protection: Proper waste disposal through recycling minimizes soil and water contamination and reduces harm to wildlife.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              'Economic benefits: Recycling creates jobs, stimulates economic growth, and promotes a circular economy.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.bottomRight,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          Text('support@trash2treasure.com'),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset('image/instagram_icon.svg'),
                          ),
                          SizedBox(width: 8),
                          Text('@trash2trasure'),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
}

class ProfilePage extends StatelessWidget {
  final UserData currentUser;

  const ProfilePage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.person), // Icon for user profile
                SizedBox(width: 8),
                Text(
                  'My Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('User Name: ' + currentUser.userName),
                              Text('Email: ' + currentUser.email),
                              Text('Phone Number: ' + currentUser.phoneNumber),
                              Text('City: ' + currentUser.location),
                            ],
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // Edit profile action
                          },
                          icon: const Icon(Icons.edit), // Icon for edit action
                          label: const Text('Edit'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton.icon(
                        label: const Text('About Us'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoPage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.info), // Information icon
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          icon: const Icon(Icons.logout),
                          label: const Text('Logout')),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
