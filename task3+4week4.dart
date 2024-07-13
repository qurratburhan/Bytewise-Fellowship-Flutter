import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Palette'),
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount =
                    orientation == Orientation.portrait ? 2 : 4;

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: _colors.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: _colors[index],
                      child: Center(
                        child: Text(
                          _colorNames[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  },
                  padding: const EdgeInsets.all(8.0),
                );
              },
            );
          },
        ),
      ),
    );
  }

  final List<Color> _colors = [
    Color(0xFF0000FF), // Blue
    Color(0xFF1A1AFF),
    Color(0xFF3333FF),
    Color.fromARGB(255, 2, 2, 119),
    Color(0xFF6666FF),
    Color(0xFF8080FF),
    Color(0xFF9999FF),
    Color(0xFFB3B3FF),
    Color(0xFFCCCCFF),
    Color(0xFFE6E6FF),
    Color(0xFF99CCFF),
    Color(0xFF66B2FF),
    Color(0xFF3399FF),
    Color(0xFF0080FF),
    Color(0xFF0066CC),
    Color(0xFF0052B2),
    Color(0xFF003D99),
    Color(0xFF002680),
    Color(0xFF001A66),
    Color(0xFF00114D),
    Color.fromARGB(255, 23, 69, 107),
    Color.fromARGB(255, 3, 101, 180),
    Color.fromARGB(255, 3, 23, 39),
  ];

  final List<String> _colorNames = [
    "Blue",
    "Electric Blue",
    "Dodger Blue",
    "Royal Blue",
    "Medium Blue",
    "Slate Blue",
    "Steel Blue",
    "Light Steel Blue",
    "Light Slate Blue",
    "Lavender",
    "Sky Blue",
    "Deep Sky Blue",
    "Cornflower Blue",
    "Azure",
    "Cobalt Blue",
    "Cerulean",
    "Indigo",
    "Prussian Blue",
    "Midnight Blue",
    "Navy Blue",
    "Dark Blue",
    "Rare Blue",
    "Sky Blue"
  ];
}
