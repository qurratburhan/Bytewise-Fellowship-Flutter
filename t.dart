import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hero Animation Example'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(imageUrl: images[index]),
                  ),
                );
              },
              child: Hero(
                tag: images[index],
                child: Image.network(images[index], fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String imageUrl;

  const DetailScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _tapCount = 0;

  @override
  void initState() {
    super.initState();
    // Add keyboard listener if needed
    // WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    // Remove keyboard listener if added
    // WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  // Example method for handling keyboard events
  // void didChangeMetrics() {
  //   setState(() {
  //     // Update state based on keyboard visibility or metrics change
  //   });
  // }

  void _incrementTapCount() {
    setState(() {
      _tapCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: GestureDetector(
        onTap: _incrementTapCount,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.imageUrl,
                child: Image.network(widget.imageUrl),
              ),
              SizedBox(height: 20),
              Text(
                'Taps: $_tapCount',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> images = [
  'https://static.vecteezy.com/system/resources/previews/006/901/769/non_2x/secure-login-and-sign-up-concept-illustration-vector.jpg',
  'https://www.shutterstock.com/image-vector/man-key-near-computer-account-260nw-1499141258.jpg',
];
