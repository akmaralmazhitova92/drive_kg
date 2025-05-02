import 'package:drive_kg/list_item.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String title;
   final List<ListItem> items;

  const CategoryPage({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
           
            child: ListTile(
              title: Text(items[index].title),
              leading: Image.asset(items[index].imagePath),
            ),
          );
        },
      ),
    );
  }
}