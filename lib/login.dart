import 'package:flutter/material.dart';
import 'homepage.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 120.0),
              child: Image.asset(
                'images/tn_logo.png',
                height: 180,
                width: 180,
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20), // Adding space between the login text and text fields
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10), // Adding space between email and password fields
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 50), // Adding space between the password field and the button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to homepage.dart
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Change the background color to black
                  ),
                ),
              ),
            ),
            // You can add other login related widgets here
          ],
        ),
      ),
    );
  }
}
