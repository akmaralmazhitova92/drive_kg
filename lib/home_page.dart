import 'dart:math';
import 'package:drive_kg/category_page.dart';
import 'package:drive_kg/list_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ListItem> list1 = [
    ListItem(title: 'Услуги', imagePath: 'assets/images/image1.png'),
    ListItem(
        title: 'Двигатель и запчасти', imagePath: 'assets/images/image2.png'),
    ListItem(title: 'Трансмиссия', imagePath: 'assets/images/image3.png'),
    ListItem(
        title: 'Детали, ходовой части', imagePath: 'assets/images/image4.png'),
    ListItem(
        title: 'Система охлаждения', imagePath: 'assets/images/image5.png'),
    ListItem(title: 'Рулевая часть', imagePath: 'assets/images/image6.png'),
  ];

  final List<ListItem> list2 = [
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

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildHorizontalList(list1),
              const SizedBox(height: 20),
              _buildHorizontalList(list2),
          
             SizedBox(height: 20),
              SizedBox(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                          width: 80,
                          height: 80,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                              color: Colors.red),
                          alignment: Alignment.center,
                          child: Text(
                            'Drive.kg',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildHorizontalList(List<ListItem> items) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length > 4 ? 5 : items.length,
        itemBuilder: (context, index) {
          if (index < 4) {
            return buildContainer(items[index]);
          } else {
            return _buildAllCategoriesContainer(items);
          }
        },
      ),
    );
  }
   Widget _buildAllCategoriesContainer(List<ListItem> items) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              title: 'Все категории',
              items: items,
            ),
          ),
        );
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.apps, color: Colors.white, size: 40),
            const SizedBox(height: 8),
            Text(
              'Все категории',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }


 Widget buildContainer(ListItem item) {
  final width = 100.0 + random.nextInt(50);
  

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(title: item.title, items: [],),
        ),
      );
    },
    child: Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              item.title,
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
                    item.imagePath,
                    fit: BoxFit.cover,
                    width: width - 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}
