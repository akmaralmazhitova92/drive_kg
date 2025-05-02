import 'dart:math';

import 'package:drive_kg/list_item.dart';
import 'package:flutter/material.dart';

class DrivePage extends StatefulWidget {
  const DrivePage({ super.key });

  @override
  _DrivePageState createState() => _DrivePageState();
}


class _DrivePageState extends State<DrivePage> {
  final List<ListItem> category = [
    ListItem(title: 'Услуги', imagePath: 'assets/images/image1.png'),
    ListItem(
        title: 'Двигатель и запчасти', imagePath: 'assets/images/image2.png'),
    ListItem(title: 'Трансмиссия', imagePath: 'assets/images/image3.png'),
    ListItem(
        title: 'Детали, ходовой части', imagePath: 'assets/images/image4.png'),
    ListItem(
        title: 'Система охлаждения', imagePath: 'assets/images/image5.png'),
    ListItem(title: 'Рулевая часть', imagePath: 'assets/images/image6.png'),
  
    ListItem(title: 'Электроника', imagePath: 'assets/images/image8.png'),
    ListItem(title: 'Оптика', imagePath: 'assets/images/image9.png'),
    ListItem(
        title: 'Кузовные элементы', imagePath: 'assets/images/image10.png'),
    ListItem(title: 'Салон и интерьер', imagePath: 'assets/images/image11.png'),
    ListItem(
        title: 'Масла и автохимия', imagePath: 'assets/images/image12.png'),
    ListItem(title: 'Шины и диски', imagePath: 'assets/images/image13.png'),
  ];
  final Random random = Random();
  
  @override
  Widget build(BuildContext context) {
      final width = 100.0 + random.nextInt(50);
    return Scaffold(
      body: GridView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: category.length, 
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
          itemBuilder: (context, index) {
            return Container(
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      category[index].title,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            category[index].imagePath,
                            fit: BoxFit.cover,
                            width: width - 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );  
          }),
    );
  }
}