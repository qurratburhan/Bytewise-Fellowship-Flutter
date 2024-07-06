import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Signup Page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 167, 195, 218),
          elevation: 2,
          title: const Text(
            ' Signup Page ',
            textAlign: TextAlign.center,
          ),
          leading: Transform.scale(
              scale: 0.9,
              child: Transform.scale(
                  scale: 1,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.menu)))),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.maximize)),
            Transform.scale(
                scale: 1,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.restore))),
            Transform.scale(
                scale: 1,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.close))),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: const SignupForm(),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _obscurePassword = true;
  bool _isPasswordFocused = false;
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 100,
          color: Color.fromARGB(255, 141, 190, 231),
          child: FittedBox(
            child: Image.network(
              'https://www.shutterstock.com/image-vector/new-user-online-registration-sign-260nw-1982734163.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          color: Color.fromARGB(255, 194, 225, 252),
          child: const FlutterLogo(
            size: 60,
            style: FlutterLogoStyle.stacked,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Create an Account',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 93, 128, 189),
            fontFamily: 'Roboto', // Custom font
          ),
        ),
        const SizedBox(
          height: 6,
          width: 500,
        ),
        AspectRatio(
          aspectRatio: 2 / 1,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 87, 126, 158),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 6.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: IntrinsicWidth(
              stepWidth: 200,
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          focusNode: _passwordFocusNode,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.white),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Offstage(
                          offstage: !_isPasswordFocused,
                          child: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Transform.translate(
          offset: const Offset(10.0, 0.0), // Apply horizontal offset
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(
                    fontSize: 18, fontFamily: 'Roboto'), // Custom font
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Sign Up"),
              onPressed: () {
                // Add your onPressed action here
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            // Add your onTap action here
          },
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: const Text(
                'Already have an account? Sign In',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
