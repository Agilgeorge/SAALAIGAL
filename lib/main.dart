import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: YourContentWidget(),
      ),
    );
  }
}

class YourContentWidget extends StatefulWidget {
  @override
  _YourContentWidgetState createState() => _YourContentWidgetState();
}

class _YourContentWidgetState extends State<YourContentWidget> {
  bool showText = false;

  @override
  void initState() {
    super.initState();
    // Delay the appearance of the text by 1 second
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showText = true;
      });
    });
  }
  void handleLoginPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: showText ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: Container(
            padding: EdgeInsets.only(bottom: 50.0),
            child: Center(
              child: Image.asset('images/tn_logo.png'),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        AnimatedOpacity(
          opacity: showText ? 1.0 : 0.0,
          duration: Duration(seconds: 2),
          child: Text(
            'சாலைகள்',
            style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 60.0),
        AnimatedOpacity(
          opacity: showText ? 1.0 : 0.0,
          duration: Duration(seconds: 2),
          child: ElevatedButton(
            onPressed: handleLoginPressed,
            style: ElevatedButton.styleFrom(
              fixedSize: Size(100.0, 50.0),
              primary: Colors.black,
            ),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
