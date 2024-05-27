import 'package:flutter/material.dart';
import 'report.dart';
class trafficpage extends StatelessWidget {
  const trafficpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  children: [
                    Image.asset(
                      'images/tn_logo.png', // Replace with your image asset path
                      height: 220,
                      width: 220,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'ROADS',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              color: Colors.grey[300],
                              width: 100,
                              height: 100,
                              child: IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  // Add your code here
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text('photo of road'),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.location_pin),
                              iconSize: 60,
                              onPressed: () {
                                // Add your code here
                              },
                            ),
                            const SizedBox(height: 10),
                            const Text('location to be tagged *'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'complaint box',
                        ),
                        maxLines: 3,
                      ),
                    ),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => reportpage())
                        );
                        // Add your code here
                      },
                      child: const Text('raise report'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: trafficpage(),
  ));
}


