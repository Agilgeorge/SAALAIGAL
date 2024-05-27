import 'package:flutter/material.dart';

class reportpage extends StatelessWidget {
  const reportpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/tn_logo.png', // Replace with your image asset path
              height: 220,
              width: 220,
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Your report has been received.\nWe will verify and get to work in 48 hours.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: reportpage(),
  ));
}
