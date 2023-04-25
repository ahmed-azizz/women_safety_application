import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  final String name;
  final String content;
  final String imageUrl;

  NewsDetailScreen({
    required this.name,
    required this.content,
    required this.imageUrl,
    required publish_date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 25,
              ),
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                content,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          );
        },
      ),
    );
  }
}
