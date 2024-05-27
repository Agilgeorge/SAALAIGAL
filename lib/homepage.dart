
import 'package:flutter/material.dart';
import 'road.dart';
import 'light.dart';
import 'traffic.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                'தமிழ்நாடு சாலை உள்கட்டமைப்பு மேம்பாட்டுக் கழகம்',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'images/road.png', // Ensure the path is correct
              height: 200, // Adjust height according to your UI needs
              width: 500, // Adjust width according to your UI needs
              fit: BoxFit.cover, // Adjust the fit of the image
            ),
            SizedBox(height: 30), // Adding some space between the image and buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Roadpage()),
                      );
                    },
                    child: Text('Fix old/broken roads'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Set button color to black
                      onPrimary: Colors.white, // Set text color to white
                      minimumSize: Size(double.infinity, 50),
                      // Full-width button
                    ),
                  ),
                  SizedBox(height: 35), // Adding space between buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => lightpage()),
                      );
                      // Add logic for 'Fix Street Lights' button
                    },
                    child: Text('Fix street lights'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Set button color to black
                      onPrimary: Colors.white, // Set text color to white
                      minimumSize: Size(double.infinity, 50), // Full-width button
                    ),
                  ),
                  SizedBox(height: 35), // Adding space between buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => trafficpage()),
                      );
                      // Add logic for 'Fix Traffic Lights' button
                    },
                    child: Text('Fix traffic lights'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Set button color to black
                      onPrimary: Colors.white, // Set text color to white
                      minimumSize: Size(double.infinity, 50), // Full-width button
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
