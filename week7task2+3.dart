import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'Multi-Theme MVVM App',
      theme: themeNotifier.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}

class User {
  String name;
  int age;

  User({required this.name, required this.age});
}

class UserViewModel extends ChangeNotifier {
  User _user = User(name: 'Sarah', age: 20);
 User  user = User(name: 'Scarlet', age: 30);
  String get name => _user.name;
  int get age => _user.age;

  void updateName(String newName) {
    _user.name = newName;
    notifyListeners();
  }

  void updateAge(int newAge) {
    _user.age = newAge;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Theme MVVM App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: ${userViewModel.name}'),
            Text('Age: ${userViewModel.age}'),
            ElevatedButton(
              onPressed: () {
                userViewModel.updateName('Scarlet');
                userViewModel.updateAge(30);
              },
              child: Text('view'),
            ),
            SizedBox(height: 20),
            Text('Toggle Theme'),
            Switch(
              value: themeNotifier.isDarkTheme,
              onChanged: (value) {
                themeNotifier.toggleTheme();
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen()),
                );
              },
              child: Text('Go to Details'),
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
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Details Page', style: Theme.of(context).textTheme.headlineMedium),
            Text('Name: ${userViewModel.name}'),
            Text('Age: ${userViewModel.age}'),
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
