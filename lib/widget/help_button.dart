import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class help_button extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<help_button> {
  Position? currentPosition;
  bool _updatingLocation = false;

  void _startLocationUpdates() async {
    // Set the updatingLocation flag to true to indicate that location updates are in progress
    setState(() {
      _updatingLocation = true;
    });

    while (_updatingLocation) {
      // Get the current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Send the location to the admin
      sendLocationToAdmin(position);

      // Wait for 3 seconds
      await Future.delayed(Duration(seconds: 3));
    }
  }

  void _stopLocationUpdates() {
    // Set the updatingLocation flag to false to indicate that location updates should stop
    setState(() {
      _updatingLocation = false;
    });
  }

  void sendLocationToAdmin(Position position) async {
    // Create a JSON payload containing the latitude and longitude
    Map<String, dynamic> payload = {
      "latitude": position.latitude,
      "longitude": position.longitude,
    };

    // Send the payload to the admin using HTTP POST
    http.Response response = await http.post(
      Uri.parse("https://example.com/send-location"),
      body: jsonEncode(payload),
      headers: {"Content-Type": "application/json"},
    );

    // Check the response status code
    if (response.statusCode == 200) {
      print("Location sent successfully");
    } else {
      print("Error sending location: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Latitude: ${currentPosition?.latitude ?? '-'}',
              ),
              Text(
                'Longitude: ${currentPosition?.longitude ?? '-'}',
              ),
              SizedBox(height: 20),
              _updatingLocation
                  ? ElevatedButton(
                      onPressed: _stopLocationUpdates,
                      child: Text('Stop Location Updates'),
                    )
                  : ElevatedButton(
                      onPressed: _startLocationUpdates,
                      child: Text('Start Location Updates'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
