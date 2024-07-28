import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/user_card.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable Widgets Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Color.fromARGB(255, 118, 163, 199),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            UserCard(
              name: 'Alice',
              email: 'alice1@example.com',
              imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/007/140/806/small/profile-glyph-circle-background-icon-vector.jpg',
            ),
            SizedBox(height: 16),
            UserCard(
              name: 'Smith',
              email: 'smith@example.com',
              imageUrl: 'https://marketplace.canva.com/EAFXS8-cvyQ/1/0/1600w/canva-brown-and-light-brown%2C-circle-framed-instagram-profile-picture-2PE9qJLmPac.jpg'
            ),// Add more UserCard widgets as needed
            SizedBox(height: 16),
            UserCard(
              name: 'Sarah',
              email: 'sarah9@example.com',
              imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/019/879/186/small/user-icon-on-transparent-background-free-png.png'
            ),// Add more UserCard widgets as needed
            SizedBox(height: 16),
            UserCard(
              name: 'Jane',
              email: 'jane90@example.com',
              imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/019/879/186/small/user-icon-on-transparent-background-free-png.png'
            ),// Add more UserCard widgets as needed

            SizedBox(height: 16),
            UserCard(
              name: 'Vane',
              email: 'vane34@example.com',
              imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/019/879/186/small/user-icon-on-transparent-background-free-png.png'
            ),// Add more UserCard widgets as needed
          ],
        ),
      ),
    );
  }
}
