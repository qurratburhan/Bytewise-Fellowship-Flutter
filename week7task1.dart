import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Themed App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.blue),
          bodyLarge: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 19, 131, 218)),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themed App Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is a themed headline',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'it is a themed  text',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen()),
                );
              },
              child: Text(' Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Details Page',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'Some detailed information goes here.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
