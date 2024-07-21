import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations and Transitions',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ColorPaletteScreen(),
    );
  }
}

class ColorPaletteScreen extends StatefulWidget {
  @override
  _ColorPaletteScreenState createState() => _ColorPaletteScreenState();
}

class _ColorPaletteScreenState extends State<ColorPaletteScreen> {
  final List<Color> _purpleShades = [
    Color(0xFFEDE7F6),
    Color(0xFFD1C4E9),
    Color(0xFFB39DDB),
    Color(0xFF9575CD),
    Color(0xFF7E57C2),
    Color(0xFF673AB7),
    Color(0xFF5E35B1),
    Color(0xFF512DA8),
    Color(0xFF4527A0),
    Color(0xFF311B92),
    Color(0xFFB388FF),
    Color(0xFF7C4DFF),
    Color(0xFF651FFF),
    Color(0xFF6200EA),
    Color(0xFF8E24AA),
    Color(0xFFD81B60),
    Color(0xFFE91E63),
    Color(0xFFF06292),
    Color(0xFFF48FB1),
    Color(0xFFF8BBD0),
    Color(0xFFCE93D8),
    Color(0xFFBA68C8),
    Color(0xFFAB47BC),
    Color(0xFF9C27B0),
    Color(0xFF8E24AA),
    Color(0xFF6A1B9A),
    Color(0xFF4A148C),
    Color(0xFFEA80FC),
    Color(0xFFE040FB),
    Color(0xFFD500F9)
  ];

  final List<String> _colorNames = [
    "Lavender",
    "Thistle",
    "Plum",
    "Violet",
    "Orchid",
    "Medium Purple",
    "Purple Heart",
    "Deep Purple",
    "Royal Purple",
    "Persian Indigo",
    "Mauve",
    "Purple Plum",
    "Electric Purple",
    "Midnight Purple",
    "Mardi Gras",
    "Cerise",
    "Hot Pink",
    "Fuchsia",
    "Pink Lace",
    "Orchid Pink",
    "Lilac",
    "Light Orchid",
    "Mulberry",
    "Byzantium",
    "Amethyst",
    "Heliotrope",
    "Pale Purple",
    "Lavender Blush",
    "Pale Plum",
    "Medium Violet Red"
  ];

  bool _showColors = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations and Transitions'),
      ),
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _purpleShades.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _showColors = !_showColors;
                });
              },
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _showColors ? 1.0 : 0.0,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  transform: _showColors
                      ? Matrix4.translationValues(0, 0, 0)
                      : Matrix4.translationValues(0, 50, 0),
                  color: _purpleShades[index],
                  child: Center(
                    child: Text(
                      _colorNames[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showColors = !_showColors;
          });
        },
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
