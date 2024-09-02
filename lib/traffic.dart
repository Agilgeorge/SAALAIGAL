import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'report.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: trafficpage(),
  ));
}

class trafficpage extends StatefulWidget {
  const trafficpage({super.key});

  @override
  _trafficpageState createState() => _trafficpageState();
}

class _trafficpageState extends State<trafficpage> {
  final _database = FirebaseDatabase.instance.reference();
  final _formKey = GlobalKey<FormState>();
  String _complaintText = '';
  Position? _currentPosition;

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
                              onPressed: () async {
                                await _getCurrentLocation();
                                await _database.child('reports').push().set({
                                  'location': _currentPosition != null
                                      ? {
                                          'latitude': _currentPosition.latitude,
                                          'longitude': _currentPosition.longitude,
                                        }
                                      : null,
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            const Text('location to be tagged *'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'complaint box',
                          ),
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a complaint';
                            }
                            return null;
                          },
                          onSaved: (value) => _complaintText = value!,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          await _database.child('reports').push().set({
                            'complaint': _complaintText,
                            'timestamp': DateTime.now().millisecondsSinceEpoch,
                            'location': _currentPosition != null
                                ? {
                                    'latitude': _currentPosition.latitude,
                                    'longitude': _currentPosition.longitude,
                                  }
                                : null,
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => reportpage()),
                          );
                        }
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

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
  }
}