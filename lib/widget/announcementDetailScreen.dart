import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class announecementDetailScreen extends StatelessWidget {
  late final String Atitle;
  late final String Acontent;
  late final String AimageUrl;

  announecementDetailScreen({
    required this.Atitle,
    required this.Acontent,
    required this.AimageUrl,
    required Apublish_date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        // elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              AimageUrl,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              Atitle,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 16.0),
            Text(
              Acontent,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
