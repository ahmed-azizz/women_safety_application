import 'package:flutter/material.dart';


class GridItem {
  final String title;
  final String imageUrl;
  final String description;

  GridItem({required this.title, required this.imageUrl, required this.description});
}

class GridWidget extends StatelessWidget {
  final List<GridItem> items;

  GridWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(items.length, (index) {
        return GridTile(
          child: Image.network(items[index].imageUrl, fit: BoxFit.cover),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(items[index].title),
            subtitle: Text(items[index].description),
          ),
        );
      }),
    );
  }
}

class MyApp extends StatelessWidget {
  final List<GridItem> items = [
    GridItem(
      title: 'Item 1',
      imageUrl: 'https://picsum.photos/id/237/200/300',
      description: 'Description for item 1',
    ),
    GridItem(
      title: 'Item 2',
      imageUrl: 'https://picsum.photos/id/238/200/300',
      description: 'Description for item 2',
    ),
    GridItem(
      title: 'Item 3',
      imageUrl: 'https://picsum.photos/id/239/200/300',
      description: 'Description for item 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(title: Text('My Grid')),
        body: GridWidget(items: items),
      ),
    );
  }
}
