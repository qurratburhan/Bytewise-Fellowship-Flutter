import 'package:flutter/material.dart';
import 't.dart'; // Import the t.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('EXPLORING WIDGETS')),
        body: Center(child: SimpleButtonExample()),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class SimpleButtonExample extends StatefulWidget {
  @override
  _SimpleButtonExampleState createState() => _SimpleButtonExampleState();
}

class _SimpleButtonExampleState extends State<SimpleButtonExample> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // GlobalKey for the form
  bool _isDragged = false;
  Offset? _tapPosition;

  // Autocomplete data source (example suggestions)
  static const List<String> suggestions = [
    'John ',
    'Lucas Scott',
    'Danbe Johnson',
    'Millie Brown',
    'James charles',
  ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _showDraggableBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.white,
              child: ListView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildImage(
                    imageUrl:
                        'https://static.vecteezy.com/system/resources/previews/006/405/794/non_2x/account-login-flat-illustration-vector.jpg',
                  ),
                  // Add more images as needed
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildImage({required String imageUrl}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                imageUrl: imageUrl,
              ),
            ),
          );
        },
        child: Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _navigateToTScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with submission
      // Example: Save data or navigate to next screen
      _navigateToTScreen();
    } else {
      // Form is not valid, handle validation errors
      // Example: Show error messages
    }
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            _tapPosition = details.globalPosition;
          });
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Text(
                    'Enter your details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return suggestions.where((option) => option
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()));
                    },
                    onSelected: (String selection) {
                      nameController.text = selection;
                    },
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController fieldController,
                        FocusNode focusNode,
                        VoidCallback onFieldSubmitted) {
                      nameController.text = fieldController.text;
                      return TextFormField(
                        controller: fieldController,
                        focusNode: focusNode,
                        onFieldSubmitted: (value) {
                          onFieldSubmitted();
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      // You can add more email validation logic if needed
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                IgnorePointer(
                  ignoring: true, // Set to false to make it active
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                    child: Text(
                      'Clear',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('The buttons above are disabled and dismissible.'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _isDragged
                        ? Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey,
                            child: Center(child: Text('Drag target')),
                          )
                        : SizedBox(width: 20),
                    GestureDetector(
                      onLongPressStart: (_) {
                        _showDraggableBottomSheet(context);
                      },
                      child: LongPressDraggable(
                        data: 'pic',
                        child: Image.network(
                          'https://png.pngtree.com/png-clipart/20220603/original/pngtree-faceless-male-profile-icon-png-image_7902585.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        feedback: Image.network(
                          'https://png.pngtree.com/png-clipart/20220603/original/pngtree-faceless-male-profile-icon-png-image_7902585.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        childWhenDragging: Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: Center(child: Text('Dragging')),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                DragTarget<String>(
                  onAccept: (data) {
                    setState(() {
                      _isDragged = true;
                    });
                  },
                  builder: (BuildContext context, List<String?> candidateData,
                      List<dynamic> rejectedData) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: _isDragged
                          ? Color.fromARGB(206, 102, 158, 141)
                          : Colors.grey,
                      child: Center(
                          child: Text(_isDragged ? 'Dropped!' : 'Drop here')),
                    );
                  },
                ),
                SizedBox(height: 20),
                _tapPosition != null
                    ? Positioned(
                        left: _tapPosition!.dx - 50,
                        top: _tapPosition!.dy - 50,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.withOpacity(0.5),
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 100,
                ), // Additional space to demonstrate scrolling
                IgnorePointer(
                  ignoring: true, // Set to false to enable interactions
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        color: Color.fromARGB(255, 151, 196, 233),
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                          child: Text(
                            'Additional Container 1',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 100,
                        color: const Color.fromARGB(255, 179, 243, 181),
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                          child: Text(
                            ' Container 2',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 100,
                        color: Color.fromARGB(255, 223, 200, 166),
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                          child: Text(
                            ' Container 3',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 230, 209, 209),
                                fontSize: 24),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                imageUrl:
                                    'https://static.vecteezy.com/system/resources/previews/006/405/794/non_2x/account-login-flat-illustration-vector.jpg',
                              ),
                            ),
                          );
                        },
                        child: Image.network(
                          'https://static.vecteezy.com/system/resources/previews/006/405/794/non_2x/account-login-flat-illustration-vector.jpg',
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                        ),
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailScreen(
                                    imageUrl: images[index],
                                  ),
                                ),
                              );
                            },
                            child: Image.network(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String imageUrl;

  const DetailScreen({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

List<String> images = [
  'https://static.vecteezy.com/system/resources/previews/006/901/769/non_2x/secure-login-and-sign-up-concept-illustration-vector.jpg',
];
