import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class get_lat_long_address extends StatefulWidget {
  @override
  _get_lat_long_addressState createState() => _get_lat_long_addressState();
}

class GeolocatorService {
  Future<Position?> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
    print("sd");
  }
}

class _get_lat_long_addressState extends State<get_lat_long_address> {
  Position? currentPosition;
  bool _updatingLocation = false;

  void _startLocationUpdates() async {
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error("location services are disabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("location permissions are denide");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("location permission denide");
    }
    setState(() {
      _updatingLocation = true;
    });

    while (_updatingLocation) {
      // Get the current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print(position.latitude);

      // Send the location to the admin
      sendLocationToAdmin(position);

      // Wait for 3 seconds
      await Future.delayed(Duration(seconds: 3));
    }
  }

  Future<void> _stopLocationUpdates() async {
    // Set the updatingLocation flag to false to indicate that location updates should stop

    // var collection = FirebaseFirestore.instance.collection('locations');
    // var snapshots = await collection.get();
    // for (var doc in snapshots.docs) {
    //   await doc.reference.delete();
    // }

    setState(() {
      _updatingLocation = false;
    });
  }

  void sendLocationToAdmin(Position position) async {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? uid = user?.uid;
    await FirebaseFirestore.instance.collection('locations').doc(uid).set({
      'latitude': position.latitude,
      'longitude': position.longitude,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        _updatingLocation
            ? SizedBox(
                height: 100,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      padding: EdgeInsets.all(20)),
                  onPressed: _stopLocationUpdates,
                  child: Text(
                    'Stop SOS',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : SizedBox(
                height: 100,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      padding: EdgeInsets.all(20)),
                  onPressed: _startLocationUpdates,
                  child: Text(
                    'Get help',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
      ]),
    );
  }
}
